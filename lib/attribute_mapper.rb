require "attribute_mapper/version"
require "attribute_mapper/base"
require "attribute_mapper/definition"
require "attribute_mapper/dsl"

module AttributeMapper
  # class Error < StandardError; end

  @registry = {}

  def self.register(klass, name)
    @registry[klass.name] ||= {}
    @registry[klass.name][name] = AttributeMapper::Base.new(klass, name)
  end

  def self.registry
    @registry
  end

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods
    def mapping(name, options = {}, &block)
      mapper = AttributeMapper.register(self, name)

      dsl = AttributeMapper::DSL.new(mapper)
      dsl.instance_eval(&block)

      AttributeMapper::Definition.define_attributes(mapper)
    end
  end

  module InstanceMethods
    def mapping
      AttributeMapper.registry[self.class.name].each.with_object({}) do |(_, mapper), object|
        object[mapper.name] = mapper.mapping
      end
    end
  end
end
