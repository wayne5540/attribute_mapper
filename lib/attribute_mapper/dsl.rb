module AttributeMapper
  class DSL
    def initialize(mapper)
      @mapper = mapper
    end

    def has_same_attributes(*args)
      args.each do |arg|
        @mapper.mapping[arg] = arg
      end
    end
    # TODO: Add #has_same_attribute alias

    # TODO: Add support for block, ex:
    # from: id, to: :token, -> { |id| id.to_s }
    def from(key, to:)
      @mapper.mapping[key] = to
    end

    # TODO: Add #add(name, &block) method, ex:
    # add :full_name, -> { "#{first_name} #{last_name}" }
  end
end
