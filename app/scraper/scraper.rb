require 'nokogiri'
require 'open-uri'

require_relative './topmovie.rb'


class Scraper

    
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/chart/moviemeter/"))
  end

  def get_top_movies
    self.get_page.css(".titleColumn")
  end

  def make_top_movies
    self.get_top_movies.each do |titleColumn|
      topMovie = Topmovie.new
      topMovie.title = titleColumn.css("a").text
    end
  end

  def print_movies
    self.make_top_movies
    Topmovie.all.each do |topMovie|
      if topMovie.title && topMovie.title != ""
        topMovie.title
      end
    end
  end


end
