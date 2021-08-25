class HomeController < ApplicationController
    get '/' do
        movies = Movie.where(rating: "TOP-MOVIE").all.limit(20)
        movies.to_json
    end
end
