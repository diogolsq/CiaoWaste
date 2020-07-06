class Meal < ApplicationRecord
  belongs_to :restaurant

  validates :name, :old_price, :new_price, :quantity, :datetime, presence: true
end
