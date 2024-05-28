# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'destroying database'
Item.destroy_all
User.destroy_all

puts 'Creating Items...'
user1 = User.create!(
  email: "test@gmail.com",
  username: "test",
  password: "testpassword"
)

user2 = User.create!(
  email: "toto@gmail.com",
  username: "toto",
  password: "totopassword"
)

scie_circulaire = Item.new(
  category: "Outils de jardinage",
  name: "Scie Circulaire",
  picture: "scie_circulaire.jpg",
  price: 15.00,
  description: "Scie circulaire performante pour tous vos travaux de découpe.",
  address: "123 Rue des Jardins, 40150 Hossegor",
  user: user1
)
scie_circulaire.save!

perceuse = Item.new(
  category: "Outils de jardinage",
  name: "Perceuse",
  picture: "perceuse.jpg",
  price: 10.00,
  description: "Perceuse robuste et facile à utiliser pour tous vos projets de bricolage.",
  address: "123 Rue des Jardins, 40150 Hossegor",
  user: user2
)
scie_circulaire.save!
puts 'Finished!'
