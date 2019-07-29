class CreateWardrobes < ActiveRecord::Migration[5.0]
  def change
     create_table :wardrobes do |t|
            t.string :name 
            t.string :user_id
      end 
  end
end
