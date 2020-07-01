class User < ApplicationRecord
  validates :first_name, :last_name, :address, presence: true
  validates :email, uniqueness: true

  has_many :orders, dependent: :destroy
  has_many :restaurants
  has_many :reviews, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :init

  def init
    self.Admin ||= false
    self.role ||= 'buyer'
  end

end
