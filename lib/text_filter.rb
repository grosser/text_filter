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

  end
end
ActiveRecord::Base.send(:extend, TextFilter::ClassMethods)
