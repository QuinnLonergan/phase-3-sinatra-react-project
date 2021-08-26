require 'nokogiri'
require 'open-uri'

require_relative './animation.rb'


class Scraperfour
    
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/search/title/?genres=animation&explore=title_type,genres"))
  end

  def get_top_movies
    self.get_page.css(".lister-item-header")
  end

  def make_top_movies
    self.get_top_movies.each do |titleColumn|
      topMovie = Animation.new
      topMovie.title = titleColumn.css("a").text
    end
  end
end