class SearchController < ApplicationController
    
    # Add your routes here
    get "/search" do
      Movie.all.to_json()
    end

    post "/search/add/:imdbID" do
        new_movie = Movie.find_or_create_by(imdb_id: params[:imdbID])
        new_movie.update(search_params)
        new_movie.to_json(:include => {:reviews => {:include => :user}})
    end

    post '/search/addReview/:imdbID/:userName' do
        new_movie = Movie.find_or_create_by(imdb_id: params[:imdbID])
        new_user = User.find_or_create_by(name: params[:userName])
        new_user.update(date_joined: DateTime.now) if new_user.date_joined.nil?
        new_user.update(profile_pic: ["https://i.imgur.com/HpCcDUy.jpeg","https://i.imgur.com/Y7GZn77.jpeg","https://i.imgur.com/iBGfZ9T.png"].sample) if new_user.profile_pic.nil?
        new_user.update(fav_movie: ["The Godfather", "The Godfather Part II", "The Godfather Part III", "The Lion King", "Kicking and Screaming", "Jumanji", "Bratz", "Legend of the Guardians: The Owls of Ga'Hoole", "Garfield", "Hot Rod"].sample) if new_user.fav_movie.nil?
        new_review = Review.find_or_create_by(user_id: new_user.id, movie_id: new_movie.id)
        new_review.update(review: params[:review], date_posted: DateTime.now, user_rating: params[:user_rating], recommend: params[:recommend])
        Movie.find_by(imdb_id: params[:imdbID]).reviews.to_json(include: :user);
    end

    get '/search/getReviews/:imdbID' do
        all_reviews = Movie.find_or_create_by(imdb_id: params[:imdbID]).reviews
        all_reviews.to_json();
    end

    delete '/search/removeReview/:imdbID/:reviewID' do
        selected_review = Movie.find_by(imdb_id: params[:imdbID]).reviews.where("id = ?", params[:reviewID])
        Review.find(params[:reviewID]).destroy
        Movie.find_by(imdb_id: params[:imdbID]).reviews.to_json(include: :user)
    end

    patch '/search/updateReview/:imdbID/:new_rating' do
        selected_movie = Movie.find_or_create_by(imdb_id: params[:imdbID])
        current_rating = selected_movie.rating
        total_rating_count = selected_movie.reviews.where.not(user_rating: NULL).count
        tatal_rating = seleted_movie.reviews.sum(:rating)
    end

    private

    def search_params
        allowed_params = %w(name imdb_id year img_url run_time genre plot rating)
        params.select {|param,value| allowed_params.include?(param)}
    end

    def add_review_params
        allowed_params = %w(userName recommend imdb_id review user_rating)
        params.select {|param,value| allowed_params.include?(param)}
    end
  
  end
