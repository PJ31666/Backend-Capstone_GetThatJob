# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all users"
User.destroy_all
puts "Start seeding Users"
puts "------------------------------------"
User.create(email: "test@mail.com", password: "123456", )
User.create(email: "hello@mail.com", password: "123456", )
puts "Finished seeding Users"
puts "------------------------------------"