# frozen_string_literal: true

require 'uuid'

module UUIDv6
  # Usage:
  #   seq = UUIDv6::Sequence.new
  #   uid = seq.call
  #   => "137ab4b3-3748-6090-80e3-0c859007c113"
  class Sequence
    attr_reader :uuid_v1

    def initialize
      @uuid_v1 = ::UUID.new
    end

    # @param uuid [String] UUID version 1 (https://tools.ietf.org/html/rfc4122)
    def call(uuid = uuid_v1.generate)
      uh = uuid.tr('-', '')
      tlo1 = uh[0...5]
      tlo2 = uh[5...8]
      tmid = uh[8...12]
      thig = uh[13...16]
      rest = uh[16...]
      uh6 = thig + tmid + tlo1 + '6' + tlo2 + rest
      to_uuid(uh6)
    end

    private

    def to_uuid(str)
      [str[0..7], str[8..11], str[12..15], str[16..19], str[20..]].join('-')
    end
  end
end
