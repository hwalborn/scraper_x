require 'bundler/setup'
require 'open-uri'
Bundler.require

require_relative '../app/controllers/application_controller.rb'
require_all 'app'
