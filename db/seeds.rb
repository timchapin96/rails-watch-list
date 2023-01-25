# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all
link = 'https://tmdb.lewagon.com/movie/top_rated'
movie_list = JSON.parse(URI.open(link).read)
new_movie_list = movie_list['results']
new_movie_list.each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'],
               rating: movie['vote_average'])
end
