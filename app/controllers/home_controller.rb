class HomeController < ApplicationController
    get '/' do
        movies = Movie.where(rating: 999).all.limit(20)
        movies.to_json
    end
    get '/toprated' do
        topratedmovies = Movie.where(rating: 420).all.limit(20)
        topratedmovies.to_json
    end
    get '/oldies' do
        oldies = Movie.where(rating: 1234).all.limit(20)
        oldies.to_json
    end
    get '/animation' do
        animation = Movie.where(rating: 1616).all.limit(20)
        animation.to_json
    end
end
