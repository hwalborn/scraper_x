require 'bundler/setup', 1.13.7
require 'open-uri'
Bundler.require

require_relative '../app/controllers/application_controller.rb'
require_all 'app'
