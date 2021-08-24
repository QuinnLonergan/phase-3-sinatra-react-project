class HomeController < ApplicationController
    
    get '/' do
        movies = Movie.all.order(:name).limit(10)
        movies.to_json
    end
end
