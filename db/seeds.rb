# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Plant.destroy_all
Booking.destroy_all
Review.destroy_all
  
5.times do
  email = Faker::Internet.email
  user = User.new(email: email, password: "123456", first_name: "Whatever", last_name: "Something")
  user.save!
end
#
Plant.create!(title: "Beautiful, tall almond tree", city: "Munich/ Germany",
description: "My 3 metres tall almond tree. It is strikingly beautiful when in flowers, it produces fragrant, five-petaled,
light pink to white flowers from late January to early April", price: 10, user: User.all.sample, url: "https://www.epicgardening.com/wp-content/uploads/2020/04/Almond-tree-in-flower.jpg" )


Plant.create!( title: "Orange tree", city: "Wolfratshausen/ Germany",
description: "The orange tree has been enchanting our garden for years. Now we want to give some joy to others.
But please be careful. Watering of the orange tree is very important, since it tends to dry off much faster.",
price: 3, user: User.all.sample,
url: "https://cdn.shopify.com/s/files/1/0061/6389/0289/products/CalamondinCalamasiOrangerd_interieur_43b69543-ccb4-43db-9aaa-e4177c35760c_x700.jpg?v=1616559296" )

Plant.create!( title: "Lemon tree", city: "Kreuzberg, Berlin/ Germany",
description: "We want to find a nice new home for our lemon tree. Be aware that a lemon tree needs plenty of water as well as sunlight.
During summer you can enjoy a fresh glass of lemonade. Rent it up to 20 days.",
price: 4, user: User.all.sample,
url: "https://i.etsystatic.com/12435877/r/il/090511/1744696884/il_fullxfull.1744696884_6l40.jpg" )

Plant.create!( title: "Green small palm", city: "Cologne/ Germany",
description: "Have positive assosiations of summer and happy memories while renting our small palm.
You can book it or up to 10 days. Open for negotations.", price: 3, user: User.all.sample,
url: "https://m.media-amazon.com/images/I/61XAo3Fs6wL._AC_SS450_.jpg" )

Plant.create!( title: "Three Rasberry plants", city: "Bremen/ Germany",
description: "Enjoy delishious rasberries during summer season. You can book our three rasberry plants for up to a year.
Contact me to learn more.",  price: 2, user: User.all.sample,
url: "https://gardenerspath.com/wp-content/uploads/2018/05/Shortcake-Raspberry.jpg" )

Plant.create!( title: "Blue Hydrangea flower", city: "Freiburg/ Germany",
description: "Hydrangeas are every gardeners favorite.
As a self-employed gardener, I have a lot of experience and can above all recommend renting my flowers during summer.
Some species can be poisonous to dogs and small children. So please be careful.", price: 8, user: User.all.sample,
url: "https://img.crocdn.co.uk/images/products2/pl/20/00/03/76/pl2000037670_card3_lg.jpg" )

Plant.create!( title: "Lemon tree", city: "Freiburg/ Germany",
description: "The 2 year old lemon tree is pretty cool. Lots of lemons every year. Just text me for negotiations.
I will try to reply.", price: 3, user: User.all.sample,
url: "http://cdn.shopify.com/s/files/1/0062/8532/8445/products/Meyer_Lemon_Tree_1_BB_4080b525-a01f-4ad7-bb5a-904162ca724d_grande.jpg?v=1631623521" )

Plant.create!( title: "Olive tree", city: "Munich/ Germany",
description: "Not without any reason is the olive-tree a symbol of peace and friendship dating back to ancient
Greek mythology.It promises a soothing and soothing environment. Our olive tree Herbert is 10 years old and provides us with lots of yummy olives.
You can rent it for a few weeks up to a year. We are open for negotiations immediately.", price: 6, user: User.all.sample,
url: "https://cdn.euroflorist.com/Products/800x800/PLA15_07M.jpg" )

Plant.create!( title: "Rare pink Orchid", city: "Hamburg/ Germany",
description: "Not only do they provide an exotic décor element, but they also promote
a sense of calm and act as a stress reliever. You can rent our beautiful pink orchid for up to ten days.", price: 3, user: User.all.sample,
url: "https://cdn.euroflorist.com/Products/800x800/4830S.jpg" )

Plant.create!( title: "Cactus", city: "Berlin/ Germany",
description: "Meet our 2 metres tall cactus. You can rent him from only a few days until several weeks.
Your choice", price: 5, user: User.all.sample,
url: "https://cb2.scene7.com/is/image/CB2/PottedCactus60inSHS17/$web_pdp_main_carousel_sm$/190905021908/potted-60-cactus.jpg" )
