class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.integer :quantity
      t.string :description
      t.float :old_price
      t.float :new_price
      t.datetime :datetime

      t.timestamps
    end
  end
end
