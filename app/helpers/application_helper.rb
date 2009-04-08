# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

   def error_messages_for(object_name, options = {})
    options = options.symbolize_keys
    object = instance_variable_get("@#{object_name}")
    unless object.errors.empty?
    items = []
    object.errors.each { |attribute, message| items << content_tag("li", message) }
    content_tag("div",
    content_tag(
    options[:header_tag] || "h2",
    "#{pluralize(object.errors.count, "erro impediu", "erros impediram")} que este registro fosse salvo/alterado:"
    ) +
    content_tag("p", "Os seguintes campos apresentaram problemas:") +
    content_tag("ul", items.join("")),
    "id" => options[:id] || "errorExplanation", "class" => options[:class] || "errorExplanation"
    )
    end
  end

  def tooltip(content, options = {}, html_options = {}, *parameters_for_method_reference)
    html_options[:title] = options[:tooltip]
    html_options[:class] = html_options[:class] || 'tooltip'
    content_tag("span", content, html_options)
  end

  def flash_message
    flashes = ''
    unless flash.size == 0
      flash.each_pair  do |key, value|
        flashes += content_tag(:div, content_tag(:div, value, :class => 'message '+key.to_s), :class => 'flash')
      end
    end
    flashes
  end

  def filter_enum obj, attr
    attr.map!(&:to_s)
    attr.map do |a|
      if a =~ /text/
        if obj.respond_to?(:map)
          obj.map { |o| o[a] = o.send(a) }
        else
          obj[a] = obj.send(a)
        end
      end
    end
    attr
  end

  def show(obj, *attr) #, &proc)
    options = attr.extract_options!
    out = filter_enum(obj, attr)
    out.map do |a|
      value = obj[a]
      case value
      when Date then value = I18n.l value
      when DateTime, Time then  value = I18n.l value
      when Numeric then value = number_with_delimiter value
      end
      "<p><b>#{obj.class.human_attribute_name(a.gsub(/_text/,""))}: </b>#{value}</p>"
    end
  end

  def simple_table_for(obj, *attr)
    return if obj.empty?
    attr.map!(&:to_s)
    attr = filter_enum(obj, attr)
    out = "<table class='table'><tr>"
    out += attr.map { |a| "<th>#{obj[0].class.human_attribute_name(a.gsub(/_text/, ""))}</th>" }.to_s + "</tr>"
    obj.map { |o| o[attr[0]] = link_to o[attr[0]], o }
    ss = obj.map { |o| attr.map { |a| "<td>#{o[a]}</td>" }}
    out += ss.map { |s| "<tr>#{s}</tr>" }.to_s
    out += "</table>"
  end

  def side_menu_for stuff
    out = "<div class='block'><h3>Menu</h3><ul class='navigation'>"
    stuff.each { |s| s.each { |s| out += "<li>#{link_to s[0], s[1]}</li>"}}
    out += "</ul></div>"
  end

  def image_list_for(stuff, title)
    out = "<div class='block' id='block-lists'><div class='content'><h2 class='title'>#{title}</h2><div class='inner'><ul class='list'>"
    stuff.map do |s|
      out += "<li><div class='left'><a href='#{s[:url]}'><img  src='#{s[:image]}' alt='avatar' /></a></div><div class='item'>"
      out += "<p>#{s[:body]}</p></div></li>"
    end
    out += "</ul></div>"
  end

  def sidebar(&block)
    content_for :sidebar do
      concat "<div class='block'><h3>Menu</h3><ul class='navigation'>"
      yield
      concat '</ul></div>'
    end
  end

  def link(name, path, *args)
    return link_to "<li>#{name}</li>", path, *(args)
  end

end
