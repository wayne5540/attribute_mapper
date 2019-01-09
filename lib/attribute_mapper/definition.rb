require "active_support/core_ext/hash/indifferent_access"

module AttributeMapper
  class Definition
    def self.define_attributes(mapper)
      mapper.klass.instance_eval do
        define_method "#{mapper.name}_attributes" do
          result = {}
  
          mapper.mapping.each do |key, value|
            result[value] = public_send(key)
          end
  
          result.with_indifferent_access
        end
      end
    end
  end
end
