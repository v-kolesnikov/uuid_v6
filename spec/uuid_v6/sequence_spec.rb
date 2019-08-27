# frozen_string_literal: true

require 'uuid_v6/sequence'

RSpec.describe UUIDv6::Sequence do
  subject(:seq) { described_class.new }

  describe '#call' do
    subject { seq.() }

    specify { expect(subject).to be_a(String) }
    specify { expect(subject.size).to eq 36 }

    specify 'idempotent behaviour' do
      uuid_v1 = ::UUID.new.generate
      uuid1 = seq.(uuid_v1)
      uuid2 = seq.(uuid_v1)
      expect(uuid2).to eq uuid1
    end

    specify 'chronological order' do
      values = Array.new(100) { seq.() }
      expect(values.sort).to eq values
    end

    specify 'unique values' do
      values = Array.new(100) { seq.() }
      expect(values.uniq).to eq values
    end
  end
end
