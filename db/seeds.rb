# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movie1 = Movie.create(title: "Movie 1", year: 2020, description: "Description 1")
movie2 = Movie.create(title: "Movie 2", year: 2020, description: "Description 2")

# Create actors and associate them with movies
actor3 = Actor.create(name: "Actor 3", movie: movie2)
actor1 = Actor.create(name: "Actor 1", movie: movie1)
actor2 = Actor.create(name: "Actor 2", movie: movie1)

Photo.create(image_url: "https://picsum.photos/200/300", actor: actor1)
Photo.create(image_url: "https://picsum.photos/200/300", actor: actor2)
Photo.create(image_url: "https://picsum.photos/200/300", actor: actor3)