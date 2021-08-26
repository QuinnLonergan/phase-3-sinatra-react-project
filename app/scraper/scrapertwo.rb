require 'nokogiri'
require 'open-uri'

require_relative './toprated.rb'


class Scrapertwo

    
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/search/title/?count=100&groups=top_1000&sort=user_rating"))
  end

  def get_top_movies
    self.get_page.css(".lister-item-header")
  end

  def make_top_movies
    self.get_top_movies.each do |titleColumn|
      topMovie = Toprated.new
      topMovie.title = titleColumn.css("a").text
    end
  end

  def print_movies
    self.make_top_movies
    Toprated.all.each do |topMovie|
      if topMovie.title && topMovie.title != ""
        topMovie.title
      end
    end
  end


end