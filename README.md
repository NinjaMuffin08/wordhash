# humanhash.rb

humanhash.rb provides human-readable representations of digests. It's clone of
Zachary Voase's [humanhash](https://github.com/zacharyvoase/humanhash)

## Caveats

Don't store the humanhash output, as its statistical uniqueness is only around
1 in 4.3 billion. Its intended use is as a human-readable (and, most
importantly, memorable) representation of a longer digest, unique enough for
display in a user interface, where a user may need to remember or verbally
communicate the identity of a hash, without having to remember a 40-character
hexadecimal sequence. Nevertheless, you should keep original digests around,
then pass them through humanize() only as you're displaying them.

## Licence

```
Copyright © 2015 Louis Pilfold. All Rights Reserved.

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.
```
