class Review < ApplicationRecord
  belongs_to :user

  validates :rating, presence: true, acceptance: { accept: (1..5) }
end
