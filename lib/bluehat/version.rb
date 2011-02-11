# -*- mode: ruby; encoding: utf-8; -*-
# -*- mode: ruby; encoding: utf-8; -*-
module Bluehat
  module VERSION #:nodoc:
    MAJOR = 0
    MINOR = 0
    TINY  = 0

    STRING = [MAJOR, MINOR, TINY].join('.')
    COPYRIGHT = "Bluehat #{STRING} / Copyright (c) 2000-#{Time.now.year} Thomas Volkmar Worm <tvw@s4r.de>"
  end
end
