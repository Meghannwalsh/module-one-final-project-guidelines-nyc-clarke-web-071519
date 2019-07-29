class CreateItems < ActiveRecord::Migration[5.0]
  def change
          create_table :items do |t|
            t.string :kind
            t.string :color
            t.string :season
            t.string :location
            t.string :size
            t.integer :user_id
            t.integer :wardrobe_id 
            t.integer :date 
            t.string :image_url
          end 
  end
end
