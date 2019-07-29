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

user1 = User.create(name: "meghann")
user2 = User.create(name: "hyo")
user3 = User.create(name: "blah")
user4 = User.create(name: "fart")

wardrobe1 = Wardrobe.create(user_id: 1, name: "meghann's wardrobe")
wardrobe2 = Wardrobe.create(user_id: 2, name: "hyo's wardrobe")
wardrobe3 = Wardrobe.create(user_id: 3, name: "blah's wardrobe")
wardrobe4 = Wardrobe.create(user_id: 3, name: "blah's second wardrobe")
wardrobe5 = Wardrobe.create(user_id: 4, name: "fart's wardrobe")
wardrobe6 = Wardrobe.create(user_id: 4, name: "fart's second wardrobe")

item1 = Item.create(kind: "top", color: "red", season: "winter", image_url: "", date: 2015, location: "new york", size: "XXXL", user_id: 1, wardrobe_id: 1)

puts "end seed"