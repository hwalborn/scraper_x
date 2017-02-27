class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  post '/result' do
    url = "http://www.pornhub.com/video/search?search="
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
