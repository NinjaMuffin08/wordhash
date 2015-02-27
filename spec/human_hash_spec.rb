require_relative 'spec_helper'

describe HumanHash do
  describe '#initialize' do
    it 'requires a wordlist of length 256' do
      expect { HumanHash.new Array.new(255, 'word') }
        .to raise_error ArgumentError

      expect { HumanHash.new Array.new(257, 'word') }
        .to raise_error ArgumentError

      expect { HumanHash.new Array.new(256, 'word') }
        .not_to raise_error
    end

    it 'will initialize with no args to use a default' do
      expect { HumanHash.new }.not_to raise_error
    end
  end
end
