class Wardrobe < ActiveRecord::Base
    has_many :items
    has_many :users, through: :items
    belongs_to :user
end 