puts "deleting old data"

User.destroy_all
Wardrobe.destroy_all
Item.destroy_all

puts "data deleted"

puts "reseting tables"

ActiveRecord::Base.connection.execute("Delete from items")
ActiveRecord::Base.connection.execute("DELETE FROM SQLIte_SEQUENCE WHERE name='items'")
ActiveRecord::Base.connection.execute("Delete from wardrobes")
ActiveRecord::Base.connection.execute("DELETE FROM SQLIte_SEQUENCE WHERE name='wardrobes'")
ActiveRecord::Base.connection.execute("Delete from users")
ActiveRecord::Base.connection.execute("DELETE FROM SQLIte_SEQUENCE WHERE name='users'")

puts "tables reset"

puts "seeding data"

User.create(name: "meghann")
User.create(name: "hyo")
User.create(name: "blah")
User.create(name: "fart")

Wardrobe.create(user_id: 1, name: "meghann's wardrobe")
Wardrobe.create(user_id: 2, name: "hyo's wardrobe")
Wardrobe.create(user_id: 3, name: "blah's wardrobe")
Wardrobe.create(user_id: 3, name: "blah's second wardrobe")
Wardrobe.create(user_id: 4, name: "fart's wardrobe")
 Wardrobe.create(user_id: 4, name: "fart's second wardrobe")


Item.create(kind: "top", color: "red", season: "winter", image_url: "", date: 2015, location: "new york", size: "XXXL", user_id: 1, wardrobe_id: 1)
Item.create(kind: "top", color: "red", season: "winter", image_url: "", date: 2005, location: "new york", size: "XXXL", user_id: 2, wardrobe_id: 1)
Item.create(kind: "bottom", color: "black", season: "summer", image_url: "", date: 2019, location: "new york", size: "XXXL", user_id: 3, wardrobe_id: 2)
Item.create(kind: "bottom", color: "black", season: "summer", image_url: "", date: 2018, location: "new york", size: "M", user_id: 3, wardrobe_id: 2)
Item.create(kind: "bottom", color: "black", season: "summer", image_url: "", date: 2019, location: "new york", size: "XXXL", user_id: 3, wardrobe_id: 3)
Item.create(kind: "shoes", color: "white", season: "summer", image_url: "", date: 2011, location: "new york", size: "m", user_id: 3, wardrobe_id: 3) 
Item.create(kind: "bottom", color: "black", season: "summer", image_url: "", date: 2014, location: "new york", size: "XXXL", user_id: 3, wardrobe_id: 2)
Item.create(kind: "shoes", color: "black", season: "winter", image_url: "", date: 2012, location: "new york", size: "s", user_id: 3, wardrobe_id: 2)
Item.create(kind: "bottom", color: "black", season: "summer", image_url: "", date: 2019, location: "new york", size: "s", user_id: 3, wardrobe_id: 2)
puts "end seed"