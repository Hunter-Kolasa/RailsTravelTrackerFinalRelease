# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create([
  { title: "Titanic", genre: "Drama", release_date: Date.today },
  { title: "Avengers", genre: "Action", release_date: Date.today },
  { title: "ET", genre: "Sci-Fi", release_date: Date.today },
  { title: "Back To The Future", genre: "Sci-Fi", release_date: Date.today },
  { title: "The Matrix", genre: "Sci-Fi", release_date: Date.today },
  { title: "Se7en", genre: "Thriller", release_date: Date.today },
  { title: "Office Space", genre: "Comedy", release_date: Date.today },
])