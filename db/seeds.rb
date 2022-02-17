puts 'Destroying all files'
User.destroy_all
UserPet.destroy_all
Pet.destroy_all
Pension.destroy_all
PensionPet.destroy_all

puts "Let's find some owners"

user_one = User.create(last_name: 'user', first_name: 'user', email: 'user@user.com', password: 'user@user.com')
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
  name: 'Felix',
  size: 'small'
)
pet_two.user = user_one
pet_two.pet = cat
pet_two.save

puts "Aren't they cute"

puts "Let's find some shelters"
Pension.create(
  name: "Le Mille Cats",
  address: "4 Chem. Champs de Lassalle, 47310 Estillac",
  departement: 'Lot-et-Garonne',
  description: "Le Mille Cats, c'est le club vacances de votre chat ! Concept unique en nouvelle Aquitaine, le Mille Cats se différencie des autres pensions par son expérience depuis 2009, c'est aussi la plus hygiénique qui existe aujourd'hui en effet nos intérieurs et extérieurs sont totalement carrelés ce qui nous permet de laver et désinfectés chaque jour, dans une collectivité, c'est primordial pour assurer des conditions sanitaires optimales et ne pas rendre malades les chats qui nous sont confiés. Nous sommes à 5 minutes d'Agen, avec accès depuis l'A62. Consultez notre site pour plus d'informations.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.173080,
  longitude: 0.574520,
  space_left: 10
)

Pension.create(
  name: "PapadamCats",
  address: "Lieu dit Maurice, 47350 Saint-Avit",
  departement: 'Lot-et-Garonne',
  description: "En Lot-et-Garonne, pension pour chats, exclusivement pour chats, propose 12 chambres individuelles de 4m2, spacieuses et confortables, avec chacune leur jardin privatif de 7m2.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.579900,
  longitude: 0.220800,
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
