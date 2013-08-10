require 'simplecov'
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'rspec'
require 'rack/test'

set :environment, :test

def app
  MockIssues
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

CODES = YAML::load_file(File.join(__dir__, '..', 'codes.yml'))
