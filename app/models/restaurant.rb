  class Restaurant < ApplicationRecord
    belongs_to :user

    validates :name, :telephone, :address, presence: true

    after_initialize :init

    def init
      self.rating ||= 0
    end
end
