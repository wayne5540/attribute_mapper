RSpec.describe AttributeMapper do
  it "has a version number" do
    expect(AttributeMapper::VERSION).not_to be nil
  end

  class FooModel
    include AttributeMapper
    
    mapping :test do
      has_same_attributes :name
      from :title, to: :suffix
    end

    def name
      "Foo"
    end

    def title
      "Mr."
    end
  end

  describe "#mapping" do
    specify do
      expect(FooModel.new.mapping).to eq({
        test: {
          name: :name,
          title: :suffix
        }
      })
    end
  end

  describe "#test_attributes" do
    specify do
      model = FooModel.new

      expect(model.test_attributes).to eq({
        name: model.name,
        suffix: model.title
      }.as_json)
    end
  end
end
