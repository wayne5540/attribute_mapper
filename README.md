# AttributeMapper

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/attribute_mapper`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attribute_mapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install attribute_mapper

## Usage

```rb
require 'attribute_mapper'

class User
  include AttributeMapper
  attr_accessor :first_name, :last_name, :stripe_token

  mapping :stripe do
    has_same_attributes :first_name, :last_name
    from :stripe_token, to: :id
  end
end

user = User.new
user.first_name = "Wayne"
user.last_name = "Chu"
user.stripe_token = "xoxo123"

user.mapping
# =>
# {
#   stripe: {
#     first_name: :first_name,
#     last_name: :last_name,
#     stripe_token: :id
#   }
# }
user.stripe_attributes
# =>
# {
#   "first_name" => "Wayne",
#   "last_name" => "Chu",
#   "id" => "xoxo123"
# }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wayne5540/attribute_mapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AttributeMapper project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/attribute_mapper/blob/master/CODE_OF_CONDUCT.md).
