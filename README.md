# UUIDv6

[![Build Status](https://travis-ci.org/v-kolesnikov/uuid_v6.svg?branch=master)](https://travis-ci.org/v-kolesnikov/uuid_v6)
[![Gem Version](https://badge.fury.io/rb/uuid_v6.svg)](https://badge.fury.io/rb/uuid_v6)

UUID version 6 implementation in Ruby. See http://gh.peabody.io/uuidv6/ for details.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uuid_v6'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uuid_v6

## Usage

```ruby
require 'uuid_v6'

seq = UUIDv6::Sequence.new

uid = seq.call
=> "137ab4b3-3748-6090-80e3-0c859007c113"

pp 10.times.map { seq.call }
["137ab4e2-8469-69d0-80fe-0c859007c113",
 "137ab4e2-8469-6aa0-80fe-0c859007c113",
 "137ab4e2-8469-6af0-80fe-0c859007c113",
 "137ab4e2-8469-6b40-80fe-0c859007c113",
 "137ab4e2-8469-6b80-80fe-0c859007c113",
 "137ab4e2-8469-6bc0-80fe-0c859007c113",
 "137ab4e2-8469-6c00-80fe-0c859007c113",
 "137ab4e2-8469-6c40-80fe-0c859007c113",
 "137ab4e2-8469-6c90-80fe-0c859007c113",
 "137ab4e2-8469-6cd0-80fe-0c859007c113"]
 => ...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/v-kolesnikov/uuid_v6. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UUIDv6 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/v-kolesnikov/uuid_v6/blob/master/CODE_OF_CONDUCT.md).
