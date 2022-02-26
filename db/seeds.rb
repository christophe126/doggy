require 'open-uri'

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

pension_one = Pension.new(
  name: "INNOVADOG",
  address: "ld Barciet, 47000 Agen",
  departement: 'Lot-et-Garonne',
  description: "Nous mettons notre expérience au service de votre compagnon afin que vous puissiez partir l'esprit tranquille. Il va sans dire que seul les animaux à jours de vaccinations seront acceptés.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.167885,
  longitude: 0.617609,
  space_left: 10
)
photo_large_left_1 = URI.open('https://scontent-cdt1-1.xx.fbcdn.net/v/t1.6435-9/41963366_296399447807987_1691733836313919488_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=cdbe9c&_nc_ohc=wIA4SUMzG0AAX8VL7tf&_nc_ht=scontent-cdt1-1.xx&oh=00_AT8u_02dsbPbVKCfHK1MJSx0NJ9HivFkTvC3Szepoe4LxA&oe=623DD0E2')
pension_one.photos.attach(io: photo_large_left_1, filename: "photo_main.jpg", content_type: 'image/jpg')
photo_thumb_1 = URI.open('https://scontent-cdg2-1.xx.fbcdn.net/v/t1.6435-9/42204400_296399547807977_67956870932856832_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=cdbe9c&_nc_ohc=5Wj-zyPTVj0AX_azFEZ&_nc_ht=scontent-cdg2-1.xx&oh=00_AT_9pv9bXBYgqO2tV8UKblCOD1JAX6_vhTwC9HmxkyD26Q&oe=623E0A96')
pension_one.photos.attach(io: photo_thumb_1, filename: "photo_thumb_1.jpg", content_type: 'image/jpg')
photo_thumb_2 = URI.open('https://scontent-cdt1-1.xx.fbcdn.net/v/t1.6435-9/42139119_296399404474658_6221417981189029888_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=cdbe9c&_nc_ohc=mA4AB88JJaMAX8co8Ck&_nc_ht=scontent-cdt1-1.xx&oh=00_AT_XEoAlsF7st31A-mxQv9G7OpIee930S65r3lBADw2iNg&oe=623D3967')
pension_one.photos.attach(io: photo_thumb_2, filename: "photo_thumb_2.jpg", content_type: 'image/jpg')
photo_thumb_3 = URI.open('https://scontent-cdg2-1.xx.fbcdn.net/v/t1.6435-9/42197955_296399217808010_4673186093225476096_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=cdbe9c&_nc_ohc=gSKc-pjGcVcAX_txEOB&_nc_ht=scontent-cdg2-1.xx&oh=00_AT-frM9_0Fl6-oaIB5E_StKYYsMsOjrnwBo9gOLSARqXEA&oe=623FF983')
pension_one.photos.attach(io: photo_thumb_3, filename: "photo_thumb_3.jpg", content_type: 'image/jpg')
photo_thumb_4 = URI.open('https://scontent-cdt1-1.xx.fbcdn.net/v/t1.6435-9/136758673_821674131947180_3830825007862209854_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=0debeb&_nc_ohc=NK0gSspQGrsAX9c0RAh&_nc_ht=scontent-cdt1-1.xx&oh=00_AT9t3FgzcHnCNaVA6V-jiUGJByW0ww6BvZ-2fpEI-tqxYw&oe=623D3E24')
pension_one.photos.attach(io: photo_thumb_4, filename: "photo_thumb_4.jpg", content_type: 'image/jpg')
pension_one.user = user_two
pension_one.save

pension_two = Pension.new(
  name: "Centre Canin Mas",
  address: "Lieu-dit Arnautot, 33210 Mazères",
  departement: 'Lot-et-Garonne',
  description: "Le centre Mas Dog vous propose un service de pension canine, d'éducation et de rééducation comportementale, ainsi que la vente d'aliments et d'accessoires au meilleur prix.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.880,
  longitude: -0.564200,
  space_left: 10,
  rating: 3
)
pension_two.user = user_two
pension_two.save

pension_three = Pension.new(
  name: "Gaya Animalia",
  address: "Rue de Patay, 33000 Bordeaux",
  departement: 'Gironde',
  description: "Pension canine sans box. En véritable colonie de vacances, votre chien vie en liberté avec un accès extérieur toute la journée",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.515258,
  longitude: -0.075177,
  space_left: 10,
  rating: 4
)
pension_three.user = user_two
pension_three.save

pension_one = Pension.new(
  name: "Innovadog",
  address: "ld Barciet, 47000 Agen",
  departement: 'Lot-et-Garonne',
  description: "Nous mettons notre expérience au service de votre compagnon afin que vous puissiez partir l'esprit tranquille. Il va sans dire que seul les animaux à jours de vaccinations seront acceptés.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.167885,
  longitude: 0.617609,
  space_left: 10,
  rating: 5
)
pension_one.user = user_two
pension_one.save

pension_four = Pension.new(
  name: "Chez Mesle",
  address: "ld Barciet, 47200 Marmande",
  departement: 'Lot-et-Garonne',
  description: "Nous mettons notre expérience au service de votre compagnon afin que vous puissiez partir l'esprit tranquille. Il va sans dire que seul les animaux à jours de vaccinations seront acceptés.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.5005,
  longitude: 0.1599,
  space_left: 10,
  rating: 4
)
pension_four.user = user_two
pension_four.save

pension_five = Pension.new(
  name: "Chez canin ",
  address: "ld Barciet, 47200 Marmande",
  departement: 'Lot-et-Garonne',
  description: "Nous mettons notre expérience au service de votre compagnon afin que vous puissiez partir l'esprit tranquille. Il va sans dire que seul les animaux à jours de vaccinations seront acceptés.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.3137,
  longitude: 0.0884,
  space_left: 10,
  rating: 2
)
pension_five.user = user_two
pension_five.save

pension_six = Pension.new(
  name: "Bergerac ",
  address: "ld Barciet, 47200 Marmande",
  departement: 'Lot-et-Garonne',
  description: "Nous mettons notre expérience au service de votre compagnon afin que vous puissiez partir l'esprit tranquille. Il va sans dire que seul les animaux à jours de vaccinations seront acceptés.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.8538,
  longitude: 0.4834,
  space_left: 10,
  rating: 1
)
pension_six.user = user_two
pension_six.save

# ------------User_Search-----------------------
search_one = UserSearch.new(
  start_address: 'Agen',
  start_lng: 0.6176112,
  start_lat: 44.2015827,
  end_address: 'Bordeaux',
  end_lng: -0.5800364,
  end_lat: 44.841225,
  direction: {
    coordinates: [
      [0.617877, 44.201502], [0.617989, 44.201841], [0.61706, 44.201977],
      [0.61643, 44.200607], [0.61197, 44.20026], [0.612239, 44.19709],
      [0.613125, 44.190639], [0.615716, 44.178617], [0.617609, 44.175249],
      [0.608989, 44.169852], [0.606388, 44.167885], [0.604994, 44.164001],
      [0.478463, 44.209849], [0.39416, 44.214353], [0.33157, 44.231019],
      [0.267239, 44.284058], [0.241403, 44.367911], [0.20215, 44.385712],
      [0.168752, 44.422126], [-0.075177, 44.515258], [-0.101097, 44.534486],
      [-0.190616, 44.530808], [-0.250735, 44.534058], [-0.350349, 44.588226],
      [-0.486054, 44.67915], [-0.556154, 44.773932], [-0.535453, 44.800001],
      [-0.539349, 44.820262], [-0.558985, 44.831861], [-0.563931, 44.835575],
      [-0.575222, 44.835022], [-0.580314, 44.834646], [-0.580803, 44.840591],
      [-0.580094, 44.840625], [-0.580121, 44.841226]
    ],
    type: "LineString"
  }.to_json
)
search_one.user = User.first
search_one.save
# ------------PensionPet-----------------------
pension_dog = PensionPet.new(pet_size: "medium", price_per_day: 30, space_per_animal: 10)
pension_dog.pet = dog
pension_dog.pension = pension_one
pension_dog.save

pension_cat = PensionPet.new(pet_size: "small", price_per_day: 18, space_per_animal: 9)
pension_cat.pet = cat
pension_cat.pension = pension_one
pension_cat.save

puts "Let's shack'em'up"

puts "Let's get booking"

booking_one = Booking.new(
  start_date: '06/03/2022',
  end_date: '09/03/2022',
  status: true,
  total_price: 135
)
booking_one.user_pet = pet_one
booking_one.pension = pension_one
booking_one.save

puts "All booked up"
