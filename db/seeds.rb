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

ghadeer_url = "https://res.cloudinary.com/dfumnsrod/image/upload/v1709654510/FluentAI/pmdcdh65o8ziu5mru84i.png"
ghadeer = User.new(username: "Ghadeer", email: "ghadeer@mail.com", password: "123123")
ghadeer.photo.attach(io: URI.open(ghadeer_url), filename: "nes1.png", content_type: "image/png")
ghadeer.save

simon_url = "https://res.cloudinary.com/dfumnsrod/image/upload/v1709654509/FluentAI/nycylovgtz5habxuhoc0.png"
simon = User.new(username: "Simon", email: "simon@mail.com", password: "123123")
simon.photo.attach(io: URI.open(simon_url), filename: "nes1.png", content_type: "image/png")
simon.save

dimitar_url = "https://res.cloudinary.com/dfumnsrod/image/upload/v1709654510/FluentAI/elgyavgcatdunnzf2wtm.png"
dimitar = User.new(username: "Dimitar", email: "dimitar@mail.com", password: "123123")
dimitar.photo.attach(io: URI.open(dimitar_url), filename: "nes1.png", content_type: "image/png")
dimitar.save

paulina_url = "https://res.cloudinary.com/dfumnsrod/image/upload/v1709654510/FluentAI/d8y19cumtkeuthkpbicn.png"
paulina = User.new(username: "Paulina", email: "paulina1@mail.com", password: "123123")
paulina.photo.attach(io: URI.open(paulina_url), filename: "nes1.png", content_type: "image/png")
paulina.save

# Topics:
supermarket = Topic.create(name: "Supermarket", description: "Conversation happens at the supermarket between you and the cashier", level: "Beginner")
airport = Topic.create(name: "Airport", description: "Conversation happens at the airport between you and the flight attendant", level: "Beginner")
restaurant = Topic.create(name: "Restaurant", description: "Conversation happens at the restaurant between you and the waitress", level: "Beginner")
directions = Topic.create(name: "Directions", description: "Conversation happens at the street between you and forigner asking for directions", level: "Beginner")
hospital = Topic.create(name: "Hospital", description: "Conversation happens at the hospital between you and the receptionist", level: "Beginner")
