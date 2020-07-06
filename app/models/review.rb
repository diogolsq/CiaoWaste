class Review < ApplicationRecord
  belongs_to :users

  validates :rating, presence: true, acceptance: { accept: (1..5) }

end
