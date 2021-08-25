puts "🌱 Seeding spices..."

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
    rating: "TOP-MOVIE"
    # rating: movie_hash["Ratings"][0]["Value"],
  )
end

# batman = Movie.create(
#     imdb_id: "tt0096895",
#     name: "Batman",
#     img_url: "https://m.media-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg",
#     year: "1989",
#     run_time:"126 min",
#     genre: "Action, Adventure",
#     plot: "The Dark Knight of Gotham City begins his war on crime with his first major enemy being Jack Napier, a criminal who becomes the clownishly homicidal Joker.",
#     rating: "7.5"
# )
# batman = Movie.create(
#     imdb_id: "tt1074638",
#     name: "Skyfall",
#     img_url: "https://m.media-amazon.com/images/M/MV5BMWZiNjE2OWItMTkwNy00ZWQzLWI0NTgtMWE0NjNiYTljN2Q1XkEyXkFqcGdeQXVyNzAwMjYxMzA@._V1_SX300.jpg",
#     year: "2012",
#     run_time: "143 min",
#     genre: "Action, Adventure, Thriller",
#     plot: "James Bond's loyalty to M is tested when her past comes back to haunt her. When MI6 comes under attack, 007 must track down and destroy the threat, no matter how personal the cost.",
#     rating: "7.7"
# )


puts "✅ Done seeding!"
