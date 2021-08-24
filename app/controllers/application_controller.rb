class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  # get "/" do
  #   { message: "Good luck with your project!" }.to_json
  # end
  get '/' do
    movies = Movie.all.order(:name).limit(10)
    movies.to_json
  end

end
