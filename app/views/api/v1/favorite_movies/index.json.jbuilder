json.array! @favorite_movies.each do |favorite_movie|
  json.id favorite_movie.id
  json.movie_id favorite_movie.movie_id
  json.user_id favorite_movie.user_id
  json.favorited_at favorite_movie.favorited_at
  json.title favorite_movie.movie.title
  json.genre favorite_movie.movie.genre
  json.date favorite_movie.movie.date
  json.director favorite_movie.movie.director
  json.actors favorite_movie.movie.actors
  json.language favorite_movie.movie.language
  json.poster favorite_movie.movie.poster
end
