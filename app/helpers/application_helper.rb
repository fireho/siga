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
        val = obj.send(a)
        obj[a.gsub!(/_text/, "")] = val
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
      "<p><b>#{obj.class.human_attribute_name(a)}: </b>#{value}</p>"
    end
  end

  def simple_table_for(obj, *attr)
   # attr = filter_enum obj, attr
    attr.map!(&:to_s)
    attr.map do |a|
      if a =~ /text/
        obj.map do |o|
          val = o.send(a)
          o[a.gsub!(/_text/, "")] = val
        end
      end
    end
    out = "<table class='table'><tr>"
    out += attr.map { |a| "<th>#{obj[0].class.human_attribute_name(a)}</th>" }.to_s + "</tr>"
    obj.map do |o|
      o[attr[0]] = link_to o[attr[0]], o
    end

    ss = obj.map { |o| attr.map { |a| "<td>#{o[a]}</td>" }}
    out += ss.map { |s| "<tr>#{s}</tr>" }.to_s
    out += "</table>"
  end
end
