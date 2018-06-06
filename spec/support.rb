# frozen_string_literal: true

require 'simplecov'

require 'rack/test'
require 'rspec'

require 'whereami'

RSpec.configure do |c|
  c.include Rack::Test::Methods
end
