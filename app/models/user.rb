class User < ActiveRecord::Base
    has_many :items 
    has_many :new_wardrobes, foreign_key: "user_id", class_name: "Wardrobe" 
    has_many :wardrobes, through: :items 
end 