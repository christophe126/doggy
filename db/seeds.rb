puts 'Destroying all files'
User.destroy_all
UserPet.destroy_all
Pet.destroy_all
Pension.destroy_all
PensionPet.destroy_all

puts "Let's find some owners"

user_one = User.create(last_name: 'user', first_name: 'user', email: 'user@user.com', password: 'user@user.com')
user_two = User.create(last_name: 'owner', first_name: 'owner', email: 'owner@owner.com', password: 'owner@owner.com', owner: true)

puts "Proud owners created"

puts "Let's create some pets"

puts "Let's specify what kind of pets we got"

dog = Pet.create(
  breed: 'dog'
)

cat = Pet.create(
  breed: 'cat'
)

pet_one = UserPet.new(
  name: 'Medor',
  size: 'Big'
)
pet_one.user = user_one
pet_one.pet = dog
pet_one.save

pet_two = UserPet.new(
  name: 'Bandit',
  size: 'small'
)
pet_two.user = user_one
pet_two.pet = dog
pet_two.save

puts "Aren't they cute"

puts "Let's find some shelters"
Pension.create(
  name: "INNOVADOG",
  address: "ld Barciet, 32340 Plieux",
  departement: 'Lot-et-Garonne',
  description: "Nous mettons notre expérience au service de votre compagnon afin que vous puissiez partir l'esprit tranquille. Il va sans dire que seul les animaux à jours de vaccinations seront acceptés.",
  region: 'Nouvelle-Aquitaine',
  latitude: 43.960430,
  longitude: 0.737860,
  space_left: 10
)

Pension.create(
  name: "Centre Canin Mas Dog",
  address: "Lieu-dit Arnautot, 33210 Mazères",
  departement: 'Lot-et-Garonne',
  description: "Le centre Mas Dog vous propose un service de pension canine, d'éducation et de rééducation comportementale, ainsi que la vente d'aliments et d'accessoires au meilleur prix.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.558070,
  longitude: 0.276060,
  space_left: 10
)


Pension.create(
  name: "Gaya Animalia",
  address: "Rue de Patay, 33000 Bordeaux",
  departement: 'Gironde',
  description: "Pension canine sans box. En véritable colonie de vacances, votre chien vie en liberté avec un accès extérieur toute la journée",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.827450,
  longitude: 0.589220,
  space_left: 10
)

puts "Let's shack'em'up"
