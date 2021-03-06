class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :telephone
      t.float :rating

      t.timestamps
    end
  end
end
