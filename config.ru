require "sinatra"
require "sinatra/reloader" if development?
require 'nokogiri'
require_relative './models/device.rb'
require_relative './controllers/device_controller.rb'

use Rack::MethodOverride
run Rack::Cascade.new([
  DeviceController
])
