class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :users, null: false, foreign_key: true
      t.references :meals, null: false, foreign_key: true
      t.string :description
      t.float :rating

      t.timestamps
    end
  end
end
