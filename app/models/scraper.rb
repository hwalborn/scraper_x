class Scraper
  attr_accessor :news_title, :porn_title, :news_link, :porn_link
  def initialize(url)
    @url = url
  end

  def scrape_porn
    html = open(@url)
    porn = Nokogiri::HTML(html)
    index = rand(porn.css('div.nf-videos ul.videos li span.title').size)
    @porn_link = "http://www.pornhub.com" + (porn.css('div.nf-videos ul.videos li span.title')[index].css('a').attribute('href').value)
    @porn_title = porn.css('div.nf-videos ul.videos li span.title')[index].css('a').text
  end

  def scrape_npr
    html = open('http://www.npr.org/sections/news/')
    news = Nokogiri::HTML(html)
    index = rand(news.css('article.item').size)
    @news_link = news.css('article.item')[index].css('a').attribute('href').value
    @news_title = news.css('article.item')[index].css('div.item-info h2.title a').text
  end

  def make_phrase
    news = scrape_npr.split(" ")
    news = news.slice(0, (news.size/2))
    porn = scrape_porn.split(" ")
    porn.slice!(0, (porn.size/2))
    (news.concat(porn)).join(" ")
  end
end
