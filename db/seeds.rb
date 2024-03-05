# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Topic.destroy_all


require "open-uri"
# users:

# ghadeer_file = URI.open("https://plus.unsplash.com/premium_photo-1675034393381-7e246fc40755?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D")
ghadeer = User.new(username: "Ghadeer", email: "ghadeer@mail.com", password: "123123")
# ghadeer.photo.attach(io: ghadeer_file, filename: "nes1.png", content_type: "image/png")
# ghadeer.save
ghadeer.save

# simon_file = URI.open("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
simon = User.new(username: "Simon", email: "simon@mail.com", password: "123123")
# simon.photo.attach(io: simon_file, filename: "nes1.png", content_type: "image/png")
simon.save

# dimitar_file = URI.open("https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
dimitar = User.new(username: "Dimitar", email: "dimitar@mail.com", password: "123123")
# dimitar.photo.attach(io: dimitar_file, filename: "nes1.png", content_type: "image/png")
dimitar.save

# paulina_file = URI.open("https://plus.unsplash.com/premium_photo-1671656333460-a3a85854d01e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
paulina = User.new(username: "Paulina", email: "paulina1@mail.com", password: "123123")
# paulina.photo.attach(io: paulina_file, filename: "nes1.png", content_type: "image/png")
paulina.save

# Topics:
supermarket = Topic.create(name: "Supermarket", description: "Conversation happens at the supermarket between you and the cashier", level: "Beginner")
airport = Topic.create(name: "Airport", description: "Conversation happens at the airport between you and the flight attendant", level: "Beginner")
restaurant = Topic.create(name: "Restaurant", description: "Conversation happens at the restaurant between you and the waitress", level: "Beginner")
directions = Topic.create(name: "Directions", description: "Conversation happens at the street between you and forigner asking for directions", level: "Beginner")
hospital = Topic.create(name: "Hospital", description: "Conversation happens at the hospital between you and the receptionist", level: "Beginner")
