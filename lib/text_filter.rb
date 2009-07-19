module TextFilter
  module ClassMethods
    def text_filter(*args)
      options = args.extract_options![:with]
      args.each do |attribute|
        define_method "#{attribute}=" do |value|
          if value.is_a? String
            [*options].each do |method|
              if method.is_a? Hash
                method.each {|name, args| value = value.send(name, *args)}
              else
                value = value.send(method)
              end
            end
          end
          write_attribute attribute, value
        end
      end
    end
  end
end
ActiveRecord::Base.send(:extend, TextFilter::ClassMethods)
