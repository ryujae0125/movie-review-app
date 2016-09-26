json.array! @movies.each do |movie|
  json.id movie.id
  json.title movie.title
  json.genre movie.genre
  json.date movie.date
  json.director movie.director
  json.actors movie.actors
  json.language movie.language
end
