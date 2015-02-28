require 'securerandom'

# Transforms hex digests to human-readable strings.
#
# The format of these strings will look something like:
# `victor-bacon-zulu-lima`. The output is obtained by compressing the input
# digest to a fixed number of bytes, then mapping those bytes to one of 256
# words. A default wordlist is provided, but you can override this if you
# prefer.
#
# As long as you use the same wordlist, the output will be consistent (i.e.
# the same digest will always render the same representation).
class HumanHash
  attr_reader :wordlist

  DEFAULT_WORDLIST = %w(
    ack alabama alanine alaska alpha angel apart april arizona arkansas artist
    asparagus aspen august autumn avocado bacon bakerloo batman beer berlin
    beryllium black blossom blue bluebird bravo bulldog burger butter
    california carbon cardinal carolina carpet cat ceiling charlie chicken
    coffee cola cold colorado comet connecticut crazy cup dakota december
    delaware delta diet don double early earth east echo edward eight eighteen
    eleven emma enemy equal failed fanta fifteen fillet finch fish five fix
    floor florida football four fourteen foxtrot freddie friend fruit gee
    georgia glucose golf green grey hamper happy harry hawaii helium high hot
    hotel hydrogen idaho illinois india indigo ink iowa island item jersey jig
    johnny juliet july jupiter kansas kentucky kilo king kitten lactose lake
    lamp lemon leopard lima lion lithium london louisiana low magazine
    magnesium maine mango march mars maryland massachusetts may mexico michigan
    mike minnesota mirror mississippi missouri mobile mockingbird monkey
    montana moon mountain muppet music nebraska neptune network nevada nine
    nineteen nitrogen north november nuts october ohio oklahoma one orange
    oranges oregon oscar oven oxygen papa paris pasta pennsylvania pip pizza
    pluto potato princess purple quebec queen quiet red river robert robin
    romeo rugby sad salami saturn september seven seventeen shade sierra single
    sink six sixteen skylark snake social sodium solar south spaghetti speaker
    spring stairway steak stream summer sweet table tango ten tennessee tennis
    texas thirteen three timing triple twelve twenty two uncle undress uniform
    uranus utah vegan venus vermont victor video violet virginia washington
    west whiskey white william winner winter wisconsin wolfram wyoming xray
    yankee yellow zebra zulu
  )

  def initialize(wordlist = DEFAULT_WORDLIST)
    fail ArgumentError, 'Wordlist must have exactly 256 items' unless
      wordlist.length == 256

    @wordlist = wordlist
  end


  # Compress a list of byte values to a fixed target length.
  #
  # Attempting to compress a smaller number of bytes to a larger
  # number is an error
  def compress(bytes, target)
    fail ArgumentError, 'Fewer input bytes than requested output' if
      target > bytes.size

    slices = slice_bytes bytes, target

    # XOR checksum-like compression
    slices.map do |slice|
      slice.reduce :^
    end
  end

  # Humanize a given hexadecimal digest.
  #
  # Change the number of words output by specifying `words`. Change the
  # word separator with `separator`.
  def humanize(hexdigest, words = 4, separator = '-')
    bytes = hexdigest.split('')
                     .each_slice(2).to_a
    bytes.pop if bytes.last.size == 1

    bytes = bytes.map { |byte| byte.join('').to_i 16 }

    wordify_bytes(bytes, words, separator)
  end

  # Generate a UUID with a human-readable representation.
  #
  # Returns `[human_repr, full_digest]`.
  # Accepts the same keyword arguments as `humanize`
  def uuid(*args)
    digest = SecureRandom.uuid.delete '-'
    human_hash = humanize digest, *args
    [digest, human_hash]
  end

  private

  def wordify_bytes(bytes, words, separator)
    compress(bytes, words).map { |byte| wordlist[byte] }
                          .join separator
  end

  def slice_bytes(bytes, target)
    slice_size = bytes.size / target
    slices = bytes.each_slice(slice_size).to_a

    # Catch any left-over bytes in the last segment.
    extra = slices.pop(slices.size - target).flatten
    slices.last.concat extra unless extra.empty?
    slices
  end
end
