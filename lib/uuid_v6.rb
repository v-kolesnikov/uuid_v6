# frozen_string_literal: true

require 'uuid_v6/sequence'
require 'uuid_v6/version'

# Usage:
#
#   UUIDv6.uuid
#   => "13bfc94b-6e81-6070-51da-2683e7d73645"
module UUIDv6
  extend self

  def uuid
    Sequence.new.()
  end
end
