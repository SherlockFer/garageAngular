require File.expand_path('../config/environment', __FILE__)
use ActiveRecord::ConnectionAdapters::ConnectionManagement
use Rack::ConditionalGet
use Rack::ETag

# Enabling CORS to allow Angular call the API
use Rack::Cors do
  allow do
    origins '*'
    resource '*',
    headers: :any,
    expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
    methods: [:get, :post, :options, :delete, :put]
  end
end

require 'rack-swagger-ui'

use Rack::Static,
  urls: ['/javascripts', '/stylesheets', '/images'],
  root: File.join(Rack::Swagger::Ui.root, 'public')

map '/swagger' do
  run Rack::Swagger::Ui::Controller.new
end

run GarageAPI::Base