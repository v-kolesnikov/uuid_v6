![](https://github.com/v-kolesnikov/uuid_v6/actions/workflows/ruby.yml/badge.svg)
[![Gem Version](https://badge.fury.io/rb/uuid_v6.svg)](https://badge.fury.io/rb/uuid_v6)

# UUIDv6

**UUID v6** pure Ruby implementation. See http://gh.peabody.io/uuidv6/ for details.

The expected[^1] use case for UUIDv6 is as a drop-in replacement for UUIDv1 which offers improved DB locality. If you don’t have the requirement to keep compatibility with UUIDv1 the suggestion is to use UUIDv7 instead. The only real difference between UUIDv6 and UUIDv1 is the order of the timestamp bits. Starting with the 60-bit timestamp, the first 48 bits of the timestamp come first in the UUID (the specification splits this between time_high, and time_mid likely to keep the same terms as RFC 4122). The next 4 bits contain the version (0110 in this case for v6) and then the final 12 bits of the timestamp can be found. This leads to the following difference:

**UUIDv1**

```
0                   1                   2                   3
0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                          time_low                             |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|       time_mid                |         time_hi_and_version   |
```

**UUIDv6**

```
0                   1                   2                   3
0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                           time_high                           |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|           time_mid            |      time_low_and_version     |
```

## Usage

```ruby
require 'uuid_v6'

UUIDv6.uuid
=> "13bfcac9-187a-6600-51fa-2683e7d73645"

# or

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

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uuid_v6'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uuid_v6

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/v-kolesnikov/uuid_v6. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UUIDv6 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/v-kolesnikov/uuid_v6/blob/master/CODE_OF_CONDUCT.md).

[^1]: https://blog.devgenius.io/analyzing-new-unique-identifier-formats-uuidv6-uuidv7-and-uuidv8-d6cc5cd7391a
