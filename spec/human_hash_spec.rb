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

  describe '#compress' do
    it 'requires a byte list longer than the target length' do
      expect { HumanHash.new.compress [1, 2, 3], 4 }
        .to raise_error ArgumentError
    end

    it do
      bytes = [96, 173, 141, 13, 135, 27, 96, 149, 128, 130, 151]
      expect(HumanHash.new.compress bytes, 4).to eq [205, 128, 156, 96]
    end

    it do
      bytes = [96, 173, 141, 13, 135, 27, 96, 149, 128, 130, 151]
      expect(HumanHash.new.compress bytes, 2).to eq [202, 123]
    end

    it do
      bytes = [96, 173, 141, 13, 135, 27, 96, 149, 128, 130, 151]
      expect(HumanHash.new.compress bytes, 8)
        .to eq [96, 173, 141, 13, 135, 27, 96, 0]
    end

    it do
      bytes = [96, 173, 141, 13, 135, 149, 128, 130, 151]
      expect(HumanHash.new.compress bytes, 3).to eq [64, 31, 149]
    end
  end
end
