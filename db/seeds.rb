puts "🌱 Seeding spices..."

User.create(name: "Roger Ebert", fav_movie: "Mean Girls", date_joined: "October, 2008", profile_pic: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2013%2F04%2Froger-ebert_612x451.jpg&q=85")
User.create(name: "Sandy Kenyon", fav_movie: "Finding Nemo", date_joined: "March, 2012", profile_pic: "https://pbs.twimg.com/profile_images/1250090830/Sandy_Kenyon_NEW_NEW_400x400.jpg")


Movie.create(imdb_id:"tt0369281" , name:"Bionicle: Mask of Light" , year: 2003 , img_url:"https://flxt.tmsimg.com/assets/p84292_v_v10_aa.jpg" , run_time: "1 Hour 10 Minutes", genre: "Animation, Action, Adventure, Crime, Family, Fantasy, Thriller" , plot: "In a land of living machines, two young ones are chosen to seek the legendary Mask of Light to reveal the savior of all the lands from the dark forces of the Makuta. During the course of their adventure, they will call on the heroes of their people, the great Toa. These Toa, masters of nature's forces such as Fire, Wind, Earth & Water, try to protect the chosen ones as they seek their destiny.", rating: 5.6)
Movie.create(imdb_id:"tt0468569" , name:"The Dark Knight" , year: 2008 , img_url:"https://amc-theatres-res.cloudinary.com/v1579118611/amc-cdn/production/2/movies/14000/13969/Poster/p_800x1200_AMC_DarkKnightThe_02072019.jpg" , run_time: "2 Hours 32 Minutes", genre: "Action, Crime, Drama" , plot: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice." , rating: 9.0)
Movie.create(imdb_id:"tt0107614" , name: "Mrs. Doubtfire" , year: 1993 , img_url:"https://www.theatermania.com/dyn/photos/theatermania/v1finw2400x0y0w1200h1892/the-original-mrs-doubtfire-movie-poster-139068.jpg" , run_time: "2 Hours 5 Minutes" , genre: "Comedy, Drama, Family" , plot: "After a bitter divorce, an actor disguises himself as a female housekeeper to spend time with his children held in custody by his former wife.", rating: 7.0)
Movie.create(imdb_id:"tt0281373" , name: "Snow Dogs", year: 2002 , img_url:"https://m.media-amazon.com/images/M/MV5BMTI0NzU5MTk1Ml5BMl5BanBnXkFtZTYwOTc4OTc2._V1_.jpg" , run_time: "1 Hour 39 Minutes", genre: "Adventure, Comedy, Family", plot: "When a Miami dentist inherits a team of sled dogs, he's got to learn the trade or lose his pack to a crusty mountain man.", rating: 5.2)

Review.create(movie_id: 1, user_id: 2, review: "I know more about Bionicle than I do my children. What a spectacular film, a feat of cinema! I smell Oscar.", date_posted: DateTime.now, user_rating: 9, recommend: true)
Review.create(movie_id: 2, user_id: 1, review: "Among the great strengths of The Dark Knight is the way it combines hardboiled naturalism with the kind of stunts and setpieces you expect in summer blockbusters.", date_posted: DateTime.now, user_rating: 8, recommend: true)
Review.create(movie_id: 3, user_id: 1, review: "This comedy's warm and soothing nature will give mainstream audiences in these dysfunctional-family times a perfect holiday uplift.", date_posted: DateTime.now, user_rating: 7, recommend: true)
Review.create(movie_id: 4, user_id: 2, review: "Pre-packaged dog crap, a dumb movie made by dull-witted adults who clearly believe that just because some viewers currently reside at the lower end of the age spectrum, they don't deserve better.", date_posted: DateTime.now, user_rating: 2, recommend: false)


# Seed your database here
puts "Creating movies..."
# movies = ['The Shawshank Redemption', 'The Godfather', 'The Dark Knight', 'The Lord of the Rings: The Fellowship of the Ring', 'Pulp Fiction', "Schindler's List", 'Forrest Gump', 'Fight Club', 'Inception', 'The Matrix']
Scraper.new.make_top_movies
Topmovie.all.each do |movie|
  response = RestClient.get "http://www.omdbapi.com/?t=#{movie.title}&apikey=429ac81a"
  movie_hash = JSON.parse(response)
  Movie.create(
    imdb_id: movie_hash["imdbID"],
    name: movie_hash["Title"],
    img_url: movie_hash["Poster"],
    year: movie_hash["Year"],
    run_time: movie_hash["Runtime"],
    genre: movie_hash["Genre"],
    plot: movie_hash["Plot"],
    rating: 999
    # rating: movie_hash["Ratings"][0]["Value"],
  )
end

Scrapertwo.new.make_top_movies
Toprated.all.first(20).each do |movie|
  response = RestClient.get "http://www.omdbapi.com/?t=#{movie.title}&apikey=429ac81a"
  movie_hash = JSON.parse(response)
  Movie.create(
    imdb_id: movie_hash["imdbID"],
    name: movie_hash["Title"],
    img_url: movie_hash["Poster"],
    year: movie_hash["Year"],
    run_time: movie_hash["Runtime"],
    genre: movie_hash["Genre"],
    plot: movie_hash["Plot"],
    rating: 420
    # rating: movie_hash["Ratings"][0]["Value"],
  )
end

Scraperthree.new.make_top_movies
Oldies.all.first(20).each do |movie|
  response = RestClient.get "http://www.omdbapi.com/?t=#{movie.title}&apikey=429ac81a"
  movie_hash = JSON.parse(response)
  Movie.create(
    imdb_id: movie_hash["imdbID"],
    name: movie_hash["Title"],
    img_url: movie_hash["Poster"],
    year: movie_hash["Year"],
    run_time: movie_hash["Runtime"],
    genre: movie_hash["Genre"],
    plot: movie_hash["Plot"],
    rating: 1234
  )
end

Scraperfour.new.make_top_movies
Animation.all.first(20).each do |movie|
  response = RestClient.get "http://www.omdbapi.com/?t=#{movie.title}&apikey=429ac81a"
  movie_hash = JSON.parse(response)
  Movie.create(
    imdb_id: movie_hash["imdbID"],
    name: movie_hash["Title"],
    img_url: movie_hash["Poster"],
    year: movie_hash["Year"],
    run_time: movie_hash["Runtime"],
    genre: movie_hash["Genre"],
    plot: movie_hash["Plot"],
    rating: 1616
  )
end


puts "✅ Done seeding!"
