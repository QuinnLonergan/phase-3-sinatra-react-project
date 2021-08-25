class HomeController < ApplicationController
    get '/' do
        movies = Movie.all.limit(20)
        movies.to_json
    end
end
