require 'rubygems'

ENV['RACK_ENV'] = 'development'

require File.expand_path('../config/environment', __dir__)

Airborne.configure do |config|
  config.rack_app = GarageAPI::Base
  #config.base_url = "http://localhost:3000"
end

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    load "db/seed.rb"
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end