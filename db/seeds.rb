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

# Topics beginner:
supermarket = Topic.create(name: "Supermarket", description: "Conversation happens at the supermarket between you and the cashier", level: "Beginner")
airport = Topic.create(name: "Airport", description: "Conversation happens at the airport between you and the flight attendant", level: "Beginner")
restaurant = Topic.create(name: "Restaurant", description: "Conversation happens at the restaurant between you and the waitress", level: "Beginner")
directions = Topic.create(name: "Directions", description: "Conversation happens at the street between you and forigner asking for directions", level: "Beginner")
hospital = Topic.create(name: "Hospital", description: "Conversation happens at the hospital between you and the receptionist", level: "Beginner")
puppy_joga = Topic.create(name: "Puppy joga", description: "Conversation happens at a puppy yoga school, you talk to another person exercising", level: "Beginner")

# Topics intermediate
hiking_url = "app/assets/images/hiking.png"
hiking = Topic.new(name: "Hike in Bavarian mountains", description: "Conversation happens during a hike between you and another hiker", level: "Intermediate")
hiking.picture.attach(io: URI.open(hiking_url), filename: "nes1.png", content_type: "image/png")
hiking.save

movie_url = "app/assets/images/cinema.png"
movie = Topic.create(name: "Last time at a cinema", description: "Conversation with your friend about last movie you watched", level: "Intermediate")
movie.picture.attach(io: URI.open(movie_url), filename: "nes1.png", content_type: "image/png")
movie.save

travel_url = "app/assets/images/travel.png"
travel = Topic.create(name: "Your dream trip", description: "Conversation happens between you and another person who loves travelling", level: "Intermediate")
travel.picture.attach(io: URI.open(travel_url), filename: "nes1.png", content_type: "image/png")
travel.save

kvr_url = "app/assets/images/office.png"
kvr = Topic.create(name: "Visit at the KVR", description: "Conversation happens between you and an officer at the Regional Administrative Office", level: "Intermediate")
kvr.picture.attach(io: URI.open(kvr_url), filename: "nes1.png", content_type: "image/png")
kvr.save

tvshow_url = "app/assets/images/tvshow.png"
tv_show = Topic.create(name: "Guilty pleasure tv show", description: "Conversation happens between you and your best friend", level: "Intermediate")
tv_show.picture.attach(io: URI.open(tvshow_url), filename: "nes1.png", content_type: "image/png")
tv_show.save

tax_url = "app/assets/images/tax.png"
tax = Topic.create(name: "Filling a tax declaration", description: "Conversation happens between you and a German accountant", level: "Intermediate")
tax.picture.attach(io: URI.open(tax_url), filename: "nes1.png", content_type: "image/png")
tax.save

healthy_lifestyle_url = "app/assets/images/fitness.png"
healthy_lifestyle = Topic.create(name: "Healthy routine", description: "Conversation about a healthy lifestyle that happens at a gym, you talk to another person exercising", level: "Intermediate")
healthy_lifestyle.picture.attach(io: URI.open(healthy_lifestyle_url), filename: "nes1.png", content_type: "image/png")
healthy_lifestyle.save

art_url = "app/assets/images/museum.png"
art = Topic.create(name: "Modern art exhibition", description: "Conversation about a modern art exhibition in your city", level: "Intermediate")
art.picture.attach(io: URI.open(art_url), filename: "nes1.png", content_type: "image/png")
art.save
