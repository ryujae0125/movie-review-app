json.array! @reviews.each do |review|
  json.partial! 'api/v1/partials/reviews.json', review: review
end
