class Profile < ApplicationRecord
  belongs_to :user
  has_many :contracts
  has_one :payment
  has_many :jobs
  has_many :reviews
  validates :address, presence: { message: "please provide address"}
  validates :phone_num, presence: {message: "please provide phone num"}

  geocoded_by :address
  after_validation :geocode

end
