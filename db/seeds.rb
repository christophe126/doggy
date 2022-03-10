require 'open-uri'

puts 'Destroying all files'
User.destroy_all
UserPet.destroy_all
Pet.destroy_all
Pension.destroy_all
PensionPet.destroy_all

puts "Let's find some owners"

user_one = User.create(last_name: 'Techer', first_name: 'Christophe', email: 'C.Techer@pets.com', password: 'C.Techer@pets.com', owner: false)
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
basket = UserBasket.create(name: "Mon Panier 1")

pet_one = UserPet.new(
  name: 'Milka',
  size: 'Big'
)
pet_one.user = user_one
pet_one.user_basket = basket
pet_one.pet = dog
pet_one.save

pet_two = UserPet.new(
  name: 'Roxy',
  size: 'small'
)

pet_two.user = user_one
pet_one.user_basket = basket
pet_two.pet = dog
pet_two.save

puts "Aren't they cute"

puts "Let's find some shelters"

pension_one = Pension.new(
  name: "Innovadog",
  address: "ld Barciet, 32340 Plieux",
  departement: 'Lot-et-Garonne',
  description: "Nous mettons notre expérience au service de votre compagnon afin que vous puissiez partir l'esprit tranquille. Il va sans dire que seul les animaux à jours de vaccinations seront acceptés.",
  region: 'Nouvelle-Aquitaine',
  latitude: 43.960430,
  longitude: 0.737860,
  space_left: 1,
  rating: 5,
  from_price: 30
)
photo_large_1 = URI.open('https://scontent-cdg2-1.xx.fbcdn.net/v/t31.18172-8/22861632_2199201270105980_4523031143024348653_o.jpg?_nc_cat=107&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=Mh3FptNlE7kAX8JDi0s&_nc_ht=scontent-cdg2-1.xx&oh=00_AT9Sg7Mlv4EayV3sylAcDQ8yjd8tME2MU5W-cGVWHBQd0w&oe=6242E58F')
pension_one.photos.attach(io: photo_large_1, filename: "photo_main.jpg", content_type: 'image/jpg')
photo_thumb_1_pension_1 = URI.open('https://scontent-cdt1-1.xx.fbcdn.net/v/t1.6435-9/45363186_2875258309166936_3050683779648585728_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=9jRP2K9LgG8AX9NB22J&_nc_ht=scontent-cdt1-1.xx&oh=00_AT9yAzkZml_Km_dnSVrdsh8LLMWldVok1WCoqhqN4Lx6-w&oe=62435409')
pension_one.photos.attach(io: photo_thumb_1_pension_1, filename: "photo_thumb_1.jpg", content_type: 'image/jpg')
photo_thumb_2_pension_1 = URI.open('https://scontent-cdg2-1.xx.fbcdn.net/v/t31.18172-8/19780527_2027108080648634_9162464560985465105_o.jpg?_nc_cat=111&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=nR6FPjG2OzsAX9_01SE&_nc_ht=scontent-cdg2-1.xx&oh=00_AT-eWeshkVkfcLh-5LFfFaSIl5jo7bCUe32mn42r3aAV6g&oe=62404EDF')
pension_one.photos.attach(io: photo_thumb_2_pension_1, filename: "photo_thumb_2.jpg", content_type: 'image/jpg')
photo_thumb_3_pension_1 = URI.open('https://scontent-cdt1-1.xx.fbcdn.net/v/t31.18172-8/20776457_2092539427438832_7801433610596524763_o.jpg?_nc_cat=101&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=LNheeW9388EAX8dsO69&_nc_ht=scontent-cdt1-1.xx&oh=00_AT_0oqvifnAWxsvNlaYQr_ncd-9853vOhoLQhyXvqQaqeA&oe=6240A041')
pension_one.photos.attach(io: photo_thumb_3_pension_1, filename: "photo_thumb_3.jpg", content_type: 'image/jpg')
photo_thumb_4_pension_1 = URI.open('https://scontent-cdg2-1.xx.fbcdn.net/v/t1.6435-9/198078826_6418999904792741_5007119955203163404_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=730e14&_nc_ohc=jxVCy3Oc32gAX-EnNWQ&_nc_ht=scontent-cdg2-1.xx&oh=00_AT_fjmM-PGiCul5vZ_a0e5AakNyaFlylr-D2rBweIi2rrg&oe=6240C6F0')
pension_one.photos.attach(io: photo_thumb_4_pension_1, filename: "photo_thumb_4.jpg", content_type: 'image/jpg')
pension_one.user = user_two
pension_one.save
puts "pension 1 ok"

pension_two = Pension.new(
  name: "Centre Canin Mas",
  address: "Lieu-dit Arnautot, 33210 Mazères",
  departement: 'Lot-et-Garonne',
  description: "Le centre Mas Dog vous propose un service de pension canine, d'éducation et de rééducation comportementale, ainsi que la vente d'aliments et d'accessoires au meilleur prix.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.880,
  longitude: -0.564200,
  space_left: 4,
  rating: 4,
  from_price: 24
)
photo_large_2 = URI.open('https://scontent-cdt1-1.xx.fbcdn.net/v/t1.6435-9/136133267_821674651947128_1011208509863749062_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=0debeb&_nc_ohc=ZxYwGYiGXhUAX9oz0ih&_nc_ht=scontent-cdt1-1.xx&oh=00_AT9pZQuvXOQe26MwqL5TThijO-M3cf1CCsJci4rlDN-vLQ&oe=6240EDD9')
pension_two.photos.attach(io: photo_large_2, filename: "photo_main.jpg", content_type: 'image/jpg')
photo_thumb_1_pension_2 = URI.open('https://scontent-cdg2-1.xx.fbcdn.net/v/t1.6435-9/137317635_821674611947132_8276776934309713316_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=0debeb&_nc_ohc=VYXJG15HIc8AX-81FLt&_nc_ht=scontent-cdg2-1.xx&oh=00_AT_Culr2AEiq8QYE29qxkBmuB4j-5_aGBwIlEbKNkQ6bwg&oe=624237C8')
pension_two.photos.attach(io: photo_thumb_1_pension_2, filename: "photo_thumb_1.jpg", content_type: 'image/jpg')
photo_thumb_2_pension_2 = URI.open('https://scontent-cdg2-1.xx.fbcdn.net/v/t1.6435-9/43219180_303351693779429_56885347186900992_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=c66uiBrOkB4AX9pCk9x&_nc_ht=scontent-cdg2-1.xx&oh=00_AT-xZFmyZ4Joq3Qcvp3dTdY87WGvwuxHNWjkeQUvm3mE_g&oe=6241DEDA')
pension_two.photos.attach(io: photo_thumb_2_pension_2, filename: "photo_thumb_2.jpg", content_type: 'image/jpg')
photo_thumb_3_pension_2 = URI.open('https://scontent-cdg2-1.xx.fbcdn.net/v/t1.6435-9/42278391_296399561141309_4198654707381567488_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=cdbe9c&_nc_ohc=Ks8H66dj__oAX897tCT&_nc_ht=scontent-cdg2-1.xx&oh=00_AT_B832qrdULOHl-vSLGl0PYVAbcinvodu6EV158DWjgZA&oe=6243098C')
pension_two.photos.attach(io: photo_thumb_3_pension_2, filename: "photo_thumb_3.jpg", content_type: 'image/jpg')
photo_thumb_4_pension_2 = URI.open('https://scontent-cdg2-1.xx.fbcdn.net/v/t1.6435-9/42117758_296397431141522_4959627963390754816_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=e3f864&_nc_ohc=MT8N7jc_IH4AX8OS9VC&_nc_ht=scontent-cdg2-1.xx&oh=00_AT87AadvMF4S4UjCmz--RFLV54Ci-bzaBmF76J1YlMG4rA&oe=6241047E')
pension_two.photos.attach(io: photo_thumb_4_pension_2, filename: "photo_thumb_4.jpg", content_type: 'image/jpg')
pension_two.user = user_two
pension_two.save
puts "pension 2 ok"

pension_three = Pension.new(
  name: "Gaya Animalia",
  address: "Rue de Patay, 33000 Bordeaux",
  departement: 'Gironde',
  description: "Pension canine sans box. En véritable colonie de vacances, votre chien vie en liberté avec un accès extérieur toute la journée",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.493210,
  longitude: -0.362870,
  space_left: 6,
  rating: 2,
  from_price: 20
)
photo_large_3 = URI.open('http://www.gayaanimalia.fr/img/10.jpg')
pension_three.photos.attach(io: photo_large_3, filename: "photo_main.jpg", content_type: 'image/jpg')
photo_thumb_1_pension_3 = URI.open('http://www.gayaanimalia.fr/img/05.jpg')
pension_three.photos.attach(io: photo_thumb_1_pension_3, filename: "photo_thumb_1.jpg", content_type: 'image/jpg')
photo_thumb_2_pension_3 = URI.open('http://www.gayaanimalia.fr/img/12.PNG')
pension_three.photos.attach(io: photo_thumb_2_pension_3, filename: "photo_thumb_2.jpg", content_type: 'image/jpg')
photo_thumb_3_pension_3 = URI.open('http://www.gayaanimalia.fr/img/13.PNG')
pension_three.photos.attach(io: photo_thumb_3_pension_3, filename: "photo_thumb_3.jpg", content_type: 'image/jpg')
photo_thumb_4_pension_3 = URI.open('http://www.gayaanimalia.fr/img/dogs.jpg')
pension_three.photos.attach(io: photo_thumb_4_pension_3, filename: "photo_thumb_4.jpg", content_type: 'image/jpg')
pension_three.user = user_two
pension_three.save
puts "pension 3 ok"
pension_four = Pension.new(
  name: "ChiensDbarques",
  address: "1 Chemin de la fontaine, 33650 Saint Selve",
  departement: 'Gironde',
  description: "Beaucoup d'exercice entre chiens, des balades dans le pré avec les chevaux, dans les bois, au bord des vignes, jusqu'au ruisseau pour se baigner.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.685270,
  longitude: -0.483010,
  space_left: 5,
  rating: 4,
  from_price: 15
)
photo_large_4 = URI.open('https://static.wixstatic.com/media/7de888_182e9f642aa64286ba3898971d5cde5c~mv2.jpg/v1/fill/w_642,h_482,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/IMG20210529111707.jpg')
pension_four.photos.attach(io: photo_large_4, filename: "photo_main.jpg", content_type: 'image/jpg')
photo_thumb_1_pension_4 = URI.open('https://static.wixstatic.com/media/7de888_5b052c1569df4c11bd9277ce288eccde~mv2.jpg/v1/fill/w_452,h_604,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/IMG_20201104_141305.jpg')
pension_four.photos.attach(io: photo_thumb_1_pension_4, filename: "photo_thumb_1.jpg", content_type: 'image/jpg')
photo_thumb_2_pension_4 = URI.open('https://static.wixstatic.com/media/7de888_ce437314843e4abdb5068e8247dc2635~mv2.jpg/v1/fill/w_536,h_402,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/IMG_20191019_164231.jpg')
pension_four.photos.attach(io: photo_thumb_2_pension_4, filename: "photo_thumb_2.jpg", content_type: 'image/jpg')
photo_thumb_3_pension_4 = URI.open('https://static.wixstatic.com/media/7de888_00e2cf2e558945749a2fc83632a0c9d0~mv2.jpg/v1/fill/w_614,h_460,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/IMG_20201005_114316.jpg')
pension_four.photos.attach(io: photo_thumb_3_pension_4, filename: "photo_thumb_3.jpg", content_type: 'image/jpg')
photo_thumb_4_pension_4 = URI.open('https://static.wixstatic.com/media/7de888_dcd0ff7a9c384dd6bba2fa9c707e09ae~mv2_d_2976_3968_s_4_2.jpg/v1/crop/x_0,y_19,w_2976,h_3459/fill/w_520,h_604,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/IMG_20180726_065409.jpg')
pension_four.photos.attach(io: photo_thumb_4_pension_4, filename: "photo_thumb_4.jpg", content_type: 'image/jpg')
pension_four.user = user_two
pension_four.save
puts "pension 4 ok"
pension_five = Pension.new(
  name: "Can Idée Educ",
  address: "20 Chemin de Capet, 33770 Salles",
  departement: 'Gironde',
  description: "En pension chez Can Idée Éducation dans le sud de la Gironde, votre chien sera hébergé dans un box spacieux à l'intérieur d'un bâtiment aménagé afin de le préserver des intempéries comme des grosses chaleurs.",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.566240,
  longitude: -0.839080,
  space_left: 7,
  rating: 5,
  from_price: 18
)
photo_large_left_5 = URI.open('https://canideeeducation.com/files/photos/small_pension2.jpeg')
pension_five.photos.attach(io: photo_large_left_5, filename: "photo_main.jpg", content_type: 'image/jpg')
photo_thumb_1_pension_5 = URI.open('https://canideeeducation.com/files/photos/small_pension8.jpeg')
pension_five.photos.attach(io: photo_thumb_1_pension_5, filename: "photo_thumb_1.jpg", content_type: 'image/jpg')
photo_thumb_2_pension_5 = URI.open('https://canideeeducation.com/files/photos/small_education2.jpg')
pension_five.photos.attach(io: photo_thumb_2_pension_5, filename: "photo_thumb_2.jpg", content_type: 'image/jpg')
photo_thumb_3_pension_5 = URI.open('https://canideeeducation.com/files/photos/small_education5.jpg')
pension_five.photos.attach(io: photo_thumb_3_pension_5, filename: "photo_thumb_3.jpg", content_type: 'image/jpg')
photo_thumb_4_pension_5 = URI.open('https://canideeeducation.com/files/photos/small_canideeeducation5.jpeg')
pension_five.photos.attach(io: photo_thumb_4_pension_5, filename: "photo_thumb_4.jpg", content_type: 'image/jpg')
pension_five.user = user_two
pension_five.save
puts "pension 5 ok"

pension_six = Pension.new(
  name: "L'écho du loup",
  address: "Lieu dit chantemignon, 47230 Feugarolles",
  departement: 'Lot-et-Garonne',
  description: "Au programme, des heures d'explorations, d'interactions et d'apprentissages sur un grand terrain sécurisé... pour la nuit, des box spacieux et individuels, de quoi passer de belles vacances !",
  region: 'Nouvelle-Aquitaine',
  latitude: 44.182030,
  longitude: 0.342780,
  space_left: 6,
  rating: 5,
  from_price: 33
)
photo_large_left_6 = URI.open('https://image.jimcdn.com/app/cms/image/transf/dimension=690x1024:format=jpg/path/s22c039c0a56cad3d/image/ief5278d1435cb48c/version/1552082126/image.jpg')
pension_six.photos.attach(io: photo_large_left_6, filename: "photo_main.jpg", content_type: 'image/jpg')
photo_thumb_1_pension_6 = URI.open('https://image.jimcdn.com/app/cms/image/transf/dimension=694x1024:format=jpg/path/s22c039c0a56cad3d/image/i4577d60f72374f78/version/1582622957/image.jpg')
pension_six.photos.attach(io: photo_thumb_1_pension_6, filename: "photo_thumb_1.jpg", content_type: 'image/jpg')
photo_thumb_2_pension_6 = URI.open('https://image.jimcdn.com/app/cms/image/transf/none/path/s22c039c0a56cad3d/image/i252ef81eb72c64ff/version/1582621958/image.jpg')
pension_six.photos.attach(io: photo_thumb_2_pension_6, filename: "photo_thumb_2.jpg", content_type: 'image/jpg')
photo_thumb_3_pension_6 = URI.open('https://image.jimcdn.com/app/cms/image/transf/dimension=940x1024:format=jpg/path/s22c039c0a56cad3d/image/i6860fec62a4de337/version/1501273616/image.jpg')
pension_six.photos.attach(io: photo_thumb_3_pension_6, filename: "photo_thumb_3.jpg", content_type: 'image/jpg')
photo_thumb_4_pension_6 = URI.open('https://image.jimcdn.com/app/cms/image/transf/none/path/s22c039c0a56cad3d/image/i22f925b333f65bf2/version/1590687949/image.jpg')
pension_six.photos.attach(io: photo_thumb_4_pension_6, filename: "photo_thumb_4.jpg", content_type: 'image/jpg')
pension_six.user = user_two
pension_six.save

puts "pension 6 ok"
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

pension_other = PensionPet.new(pet_size: "medium", price_per_day: 24, space_per_animal: 10)
pension_other.pet = cat
pension_other.pension = pension_two
pension_other.save

pension_dog = PensionPet.new(pet_size: "medium", price_per_day: 24, space_per_animal: 5)
pension_dog.pet = dog
pension_dog.pension = pension_two
pension_dog.save

pension_dog = PensionPet.new(pet_size: "large", price_per_day: 20, space_per_animal: 10)
pension_dog.pet = dog
pension_dog.pension = pension_three
pension_dog.save

pension_dog = PensionPet.new(pet_size: "small", price_per_day: 15, space_per_animal: 10)
pension_dog.pet = dog
pension_dog.pension = pension_four
pension_dog.save

pension_cat = PensionPet.new(pet_size: "small", price_per_day: 15, space_per_animal: 9)
pension_cat.pet = cat
pension_cat.pension = pension_four
pension_cat.save

pension_cat = PensionPet.new(pet_size: "small", price_per_day: 18, space_per_animal: 9)
pension_cat.pet = cat
pension_cat.pension = pension_five
pension_cat.save

pension_dog_five = PensionPet.new(pet_size: "small", price_per_day: 18, space_per_animal: 9)
pension_dog_five.pet = dog
pension_dog_five.pension = pension_five
pension_dog_five.save

pension_dog = PensionPet.new(pet_size: "large", price_per_day: 33, space_per_animal: 10)
pension_dog.pet = dog
pension_dog.pension = pension_six
pension_dog.save

pension_cat = PensionPet.new(pet_size: "small", price_per_day: 33, space_per_animal: 9)
pension_cat.pet = cat
pension_cat.pension = pension_six
pension_cat.save

puts "Let's shack'em'up"

puts "Let's get booking"

# booking_one = Booking.new(
#   start_date: '06/03/2022',
#   end_date: '09/03/2022',
#   status: true,
#   total_price: 135
# )
# booking_one.user = user_one
# booking_one.user_basket = basket
# booking_one.pension = pension_one
# booking_one.save

puts "All booked up"
