
module Showtastic
  class SemanticShowBuilder < ActionView::Helpers::FormBuilder
    @@label_str_method = :humanize

    INPUT_MAPPINGS = {
      :string   => :text_field,
      :date     => :password_field,
      :numeric  => :text_field,
      :text     => :text_area,
      :file     => :file_field,
      :money    => :money,

    }

    def show(method, options = { })
      options[:as]     ||= :text # default_input_type(method)
      options[:label]  ||= if @object
                             @object.class.human_attribute_name(method.to_s)
                           else
                             method.to_s.send(@@label_str_method)
                           end

      "<p><b>#{@object.class.human_attribute_name(method)}: </b>#{@object[method]}</p>"

    end
  #   def filter_enum obj, attr
  #   attr.map!(&:to_s)
  #   attr.map do |a|
  #     if a =~ /text/
  #       val = obj.send(a)
  #       obj[a.gsub!(/_text/, "")] = val
  #     end
  #   end
  #   attr
  # end

  # def show(obj, *attr, &proc)
  #   out = filter_enum(obj, attr)
  #   out.map { |a| "<p><b>#{obj.class.human_attribute_name(a)}: </b>#{obj[a]}</p>" }
  # end

  end

  module SemanticShowHelper
    def semantic_show(record_or_name, *args, &proc)
     #  puts record_or_name.inspect
      yield SemanticShowBuilder.new(record_or_name, record_or_name, self, args, proc)
    end
  end

end
