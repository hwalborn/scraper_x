require 'uglifier'
require 'sprockets'
class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  set :environment, Sprockets::Environment.new

  # append assets paths
  environment.append_path "assets/stylesheets"
  environment.append_path "assets/javascripts"

  # compress assets
  environment.js_compressor  = :uglify
  environment.css_compressor = :scss

  # get assets
  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  get '/' do
    erb :index
  end

  post '/result' do
    url = "https://www.pornhub.com/video/search?search="
    arr = params[:subject].split(" ")
    arr.each_with_index do |word, index|
      if index == 0
        url = url + word.downcase
      else
        url = url + "+" + word.downcase
      end
    end
    @porn = Scraper.new(url)
    @phrase = @porn.make_phrase
    erb :show
  end
end
