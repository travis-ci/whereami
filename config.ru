# frozen_string_literal: true

libdir = File.expand_path('./lib', __dir__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'whereami'

run Whereami::App
