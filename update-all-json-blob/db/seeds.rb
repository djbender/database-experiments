# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Cat.create!(
  [
    { name: "Lucy", config: { foo: [:bar, :baz], features: { chonky: true  } } },
    { name: "Fen",  config: { foo: [:bar, :baz], features: { chonky: false } } },
    { name: "Zaz",  config: { foo: [:bar, :baz], features: { chonky: true  } } }
  ]
)
