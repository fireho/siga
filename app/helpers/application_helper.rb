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

  # def flash_message
  #   messages = ""
  #   [:notice, :info, :warning, :error].each {|type|
  #     if flash[type]
  #       messages += "<p class=\"#{type}\">#{flash[type]}</p>"
  #     end
  #   }
  #   messages
  # end

  def flash_message
    flashes = ''
    unless flash.size == 0
      flash.each_pair  do |key, value|
        flashes += content_tag(:div, content_tag(:div, value, :class => 'message '+key.to_s), :class => 'flash')
      end
    end
    flashes
  end




end
