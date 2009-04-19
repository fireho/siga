module Autocomplete

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def autocomplete(*fields)
      for field in fields
        self.class_eval <<-CLASS_METHODS

        def #{field}_text
          #{field}.try(:name)
        end

        def #{field}_text=(value)
          @#{field}_text = value
        end

        CLASS_METHODS
      end

    end

  end

end
