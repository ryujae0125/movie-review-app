json.array! @favorite_movies.each do |favorite_movie|
  json.id favorite_movie.id
  json.title favorite_movie.movie.title
  json.genre favorite_movie.movie.genre
  json.date favorite_movie.movie.date
  json.director favorite_movie.movie.director
  json.actors favorite_movie.movie.actors
  json.language favorite_movie.movie.language
end
