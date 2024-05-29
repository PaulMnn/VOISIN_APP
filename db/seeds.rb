# db/seeds.rb

puts 'Destroying database...'
Item.destroy_all
User.destroy_all

puts 'Creating Users...'
users = [
  { email: "lucie@gmail.com", username: "LucieDurak", password: "luciepassword" },
  { email: "paul@gmail.com", username: "PaulManein", password: "paulpassword" },
  { email: "louis@gmail.com", username: "LouisCarmen", password: "louispassword" },
  { email: "snith@gmail.com", username: "Snith", password: "snithpassword" },
  { email: "marie@gmail.com", username: "MarieDubois", password: "mariepassword" }
]

users.each do |user_data|
  User.create!(user_data)
end

puts 'Creating Items...'
items = [
  { category: "Outils de jardinage", name: "Scie Circulaire", picture: "app/assets/images/items_imagess/scie_circulaire.jpg", price: 15.00, description: "Scie circulaire performante pour tous vos travaux de découpe.", address: "123 Rue des Jardins, 40150 Hossegor", user: User.find_by(email: "lucie@gmail.com") },
  { category: "Outils de jardinage", name: "Tondeuse", picture: "app/assets/images/items_imagess/tondeuse.jpg", price: 20.00, description: "Tondeuse puissante pour entretenir votre jardin facilement.", address: "124 Rue des Fleurs, 40150 Hossegor", user: User.find_by(email: "lucie@gmail.com") },
  { category: "Électroménager", name: "Fer à repasser", picture: "app/assets/images/items_imagess/fer_a_repasser.jpg", price: 8.00, description: "Fer à repasser efficace pour des vêtements sans plis en un rien de temps.", address: "125 Rue des Arbustes, 40150 Hossegor", user: User.find_by(email: "lucie@gmail.com") },
  { category: "Outils de bricolage", name: "Perceuse", picture: "app/assets/images/items_imagess/perceuse.jpg", price: 10.00, description: "Perceuse robuste et facile à utiliser pour tous vos projets de bricolage.", address: "126 Avenue des Champs, 40150 Hossegor", user: User.find_by(email: "paul@gmail.com") },
  { category: "Outils de bricolage", name: "Marteau", picture: "app/assets/images/items_imagess/marteau.jpg", price: 5.00, description: "Marteau durable pour tous vos travaux de construction et de réparation.", address: "127 Avenue des Pins, 40150 Hossegor", user: User.find_by(email: "paul@gmail.com") },
  { category: "Électroménager", name: "Machine à coudre", picture: "app/assets/images/items_imagess/machine_a_coudre.jpg", price: 12.00, description: "Machine à coudre de haute qualité pour vos créations de couture.", address: "128 Rue des Tulipes, 40150 Hossegor", user: User.find_by(email: "paul@gmail.com") },
  { category: "Mobilier", name: "Lit à barreaux", picture: "app/assets/images/items_imagess/lit_a_barreaux.jpg", price: 25.00, description: "Lit à barreaux confortable et sûr pour les nourrissons.", address: "129 Rue des Rosiers, 40150 Hossegor", user: User.find_by(email: "louis@gmail.com") },
  { category: "Mobilier", name: "Chaise haute", picture: "app/assets/images/items_imagess/chaise_haute.jpg", price: 10.00, description: "Chaise haute pratique pour les repas des tout-petits.", address: "130 Rue des Lilas, 40150 Hossegor", user: User.find_by(email: "louis@gmail.com") },
  { category: "Sports et loisirs", name: "Vélo", picture: "app/assets/images/items_imagess/velo.jpg", price: 15.00, description: "Vélo tout-terrain pour des aventures en plein air.", address: "131 Avenue des Palmiers, 40150 Hossegor", user: User.find_by(email: "louis@gmail.com") },
  { category: "Outils de jardinage", name: "Taille-haie", picture: "app/assets/images/items_imagess/taille_haie.jpg", price: 18.00, description: "Taille-haie électrique pour tailler vos haies facilement.", address: "132 Rue des Cyprès, 40150 Hossegor", user: User.find_by(email: "snith@gmail.com") },
  { category: "Outils de bricolage", name: "Clé à molette", picture: "app/assets/images/items_imagess/cle_a_molette.jpg", price: 7.00, description: "Clé à molette ajustable pour divers travaux de plomberie.", address: "133 Avenue des Oliviers, 40150 Hossegor", user: User.find_by(email: "snith@gmail.com") },
  { category: "Sports et loisirs", name: "Kayak", picture: "app/assets/images/items_imagess/kayak.jpg", price: 30.00, description: "Kayak robuste pour des sorties en rivière ou en mer.", address: "134 Rue des Peupliers, 40150 Hossegor", user: User.find_by(email: "snith@gmail.com") },
  { category: "Électroménager", name: "Mixeur", picture: "app/assets/images/items_imagess/mixeur.jpg", price: 6.00, description: "Mixeur pratique pour préparer vos smoothies et soupes.", address: "135 Rue des Chênes, 40150 Hossegor", user: User.find_by(email: "marie@gmail.com") },
  { category: "Électroménager", name: "Grille-pain", picture: "app/assets/images/items_imagess/grille_pain.jpg", price: 5.00, description: "Grille-pain rapide pour des petits-déjeuners parfaits.", address: "136 Rue des Érables, 40150 Hossegor", user: User.find_by(email: "marie@gmail.com") },
  { category: "Mobilier", name: "Canapé-lit", picture: "app/assets/images/items_imagess/canape_lit.jpg", price: 50.00, description: "Canapé-lit confortable pour accueillir vos invités.", address: "137 Rue des Ormes, 40150 Hossegor", user: User.find_by(email: "marie@gmail.com") }
]

items.each do |item_data|
  picture = item_data.delete(:picture)
  item = Item.new(item_data)
  item.picture.attach(io: File.open(picture), filename: picture, content_type: "image/png")
  item.save
end

puts 'Finished!'
