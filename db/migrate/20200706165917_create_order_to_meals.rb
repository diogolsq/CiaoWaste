class CreateOrderToMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :order_to_meals do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
