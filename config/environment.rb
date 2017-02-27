require 'bundler/setup', 1.14.5
require 'open-uri'
Bundler.require

require_relative '../app/controllers/application_controller.rb'
require_all 'app'
