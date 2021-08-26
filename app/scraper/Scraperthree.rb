require 'nokogiri'
require 'open-uri'

require_relative './oldies.rb'


class Scraperthree

    
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/search/title/?groups=top_1000&sort=release_date,asc"))
  end

  def get_top_movies
    self.get_page.css(".lister-item-header")
  end

  def make_top_movies
    self.get_top_movies.each do |titleColumn|
      topMovie = Oldies.new
      topMovie.title = titleColumn.css("a").text
    end
  end

  def print_movies
    self.make_top_movies
    Oldies.all.each do |topMovie|
      if topMovie.title && topMovie.title != ""
        topMovie.title
      end
    end
  end


end