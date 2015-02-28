# wordhash

[![Build Status](https://travis-ci.org/lpil/wordhash.svg?branch=master)](https://travis-ci.org/lpil/humanhash.rb)
[![Code Climate](https://codeclimate.com/github/lpil/wordhash/badges/gpa.svg)](https://codeclimate.com/github/lpil/humanhash.rb)

wordhash provides human-readable representations of digests.  
A clone of Zachary Voase's
[humanhash](https://github.com/zacharyvoase/humanhash).

## Example

```ruby
require 'word_hash'

digest = '7528880a986c40e78c38115e640da2a1'
# => "7528880a986c40e78c38115e640da2a1"

WordHash.new.humanize digest
# => "three-georgia-xray-jig"
WordHash.new.humanize digest, 6
# => "high-mango-white-oregon-purple-charlie"

WordHash.new.uuid
# => ["04edcd5325a34dc191d4880676ebae61", "lemon-artist-snake-gee"]
```

## Caveats

Don't store the humanhash output, as its statistical uniqueness is only around
1 in 4.3 billion. Its intended use is as a human-readable (and, most
importantly, memorable) representation of a longer digest, unique enough for
display in a user interface, where a user may need to remember or verbally
communicate the identity of a hash, without having to remember a 40-character
hexadecimal sequence. Nevertheless, you should keep original digests around,
then pass them through humanize() only as you're displaying them.

## How It Works

The procedure for generating a humanhash involves compressing the input to a
fixed length (default: 4 bytes), then mapping each of these bytes to a word in
a pre-defined wordlist (a default wordlist is supplied with the library). This
algorithm is consistent, so the same input, given the same wordlist, will
always give the same output. You can also use your own wordlist, and specify a
different number of words for output.

(The algorithm and this text are completely lifted from Zachary's version)

## Licence

```
Copyright © 2015 Louis Pilfold. All Rights Reserved.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
