class CreateCasts < ActiveRecord::Migration[7.1]
  def change
    create_table :casts do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :place_of_birth
      t.text :biography
      t.string :gender
      t.string :nationality
      t.integer :height
      t.integer :weight
      t.string :social_media_links
      t.string :profile_picture

      t.timestamps
    end
  end
end
