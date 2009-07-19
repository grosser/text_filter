#Original
#module Dawanda
#  module ModelExtensions
#    module TextFilter
#
#      def self.included(base)
#        base.extend(ClassMethods)
#      end
#
#      module ClassMethods
#
#        def textfilter(filter_calls,*methods)
#          if filter_calls.kind_of?(String) or filter_calls.kind_of?(Symbol)
#            filter_calls = Array.new(1,filter_calls)
#          end
#          method_definitions = ""
#          for method in methods
#            method_name = "#{method.to_s}="
#            method_definitions << %Q{
#              def #{method_name}(new_value)
#                filter_calls = #{filter_calls.inspect}
#                filter_calls.each do |call|
#                    new_value = new_value.send(call.to_sym)
#                end
#                write_attribute("#{method}",new_value)
#                new_value
#              end
#            }
#          end
#          class_eval method_definitions
#        end
#
#      end
#
#
#    end
#  end
#end
#
#
#ActiveRecord::Base.send(:include, Dawanda::ModelExtensions::TextFilter)

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
