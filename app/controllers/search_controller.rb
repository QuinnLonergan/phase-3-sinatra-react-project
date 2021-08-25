class SearchController < ApplicationController
    
    # Add your routes here
    get "/search" do
      { message: "does this work" }.to_json
    end

    post "/search/add/:imdbID" do
        new_movie = Moive.find_or_create(imdb_id: imdbID)
        new_movie.update(search_params)
        new_movie.to_json()
    end

    private

    def search_params
        allowed_params = %w(name imdb_id year img_url run_time genre plot rating)
        params.select {|param,value| allowed_params.include?(param)}
    end
  
  end