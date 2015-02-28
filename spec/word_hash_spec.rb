require_relative 'spec_helper'

describe WordHash do
  describe '#initialize' do
    it 'requires a wordlist of length 256' do
      expect { WordHash.new Array.new(255, 'word') }
        .to raise_error ArgumentError

      expect { WordHash.new Array.new(257, 'word') }
        .to raise_error ArgumentError

      expect { WordHash.new Array.new(256, 'word') }
        .not_to raise_error
    end

    it 'will initialize with no args to use a default' do
      expect { WordHash.new }.not_to raise_error
    end
  end

  describe '#compress' do
    it 'requires a byte list longer than the target length' do
      expect { WordHash.new.compress [1, 2, 3], 4 }
        .to raise_error ArgumentError
    end

    it do
      bytes = [96, 173, 141, 13, 135, 27, 96, 149, 128, 130, 151]
      expect(WordHash.new.compress bytes, 4).to eq [205, 128, 156, 96]
    end

    it do
      bytes = [96, 173, 141, 13, 135, 27, 96, 149, 128, 130, 151]
      expect(WordHash.new.compress bytes, 2).to eq [202, 123]
    end

    it do
      bytes = [96, 173, 141, 13, 135, 27, 96, 149, 128, 130, 151]
      expect(WordHash.new.compress bytes, 8)
        .to eq [96, 173, 141, 13, 135, 27, 96, 0]
    end

    it do
      bytes = [96, 173, 141, 13, 135, 149, 128, 130, 151]
      expect(WordHash.new.compress bytes, 3).to eq [64, 31, 149]
    end
  end

  describe '#humanize' do
    it 'humanizes' do
      digest = '60ad8d0d871b6095808297'
      expect(WordHash.new.humanize digest)
        .to eq 'sodium-magnesium-nineteen-hydrogen'
    end

    it do
      expect(WordHash.new.humanize '60ad8d0d871b60958082971')
        .to eq 'sodium-magnesium-nineteen-hydrogen'
    end

    it do
      expect(WordHash.new.humanize '295734958734589739587')
        .to eq 'low-october-princess-pennsylvania'
    end

    it do
      expect(WordHash.new.humanize '2398532498572856792989')
        .to eq 'robin-lemon-south-oregon'
    end

    it do
      expect(WordHash.new.humanize '205934859384566493698')
        .to eq 'lima-pluto-blossom-six'
    end

    it do
      expect(WordHash.new.humanize '298234859234895734895389')
        .to eq 'november-cat-vegan-georgia'
    end
  end
end
