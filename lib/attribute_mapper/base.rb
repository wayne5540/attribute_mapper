module AttributeMapper
  class Base
    attr_reader :klass, :name, :mapping

    def initialize(klass, name)
      @name = name
      @klass = klass
      @mapping = {}
    end
  end
end
