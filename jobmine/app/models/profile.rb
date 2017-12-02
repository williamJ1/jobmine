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

  def update_average_rating(profile_id)
    profile = Profile.find_by(id: profile_id)
    @value = 0
    profile.reviews.each do |review|
      @value = @value + review.rating
    end
    @total = profile.reviews.size

    profile.update_attributes(average_rating: (@value.to_f) / (@total.to_f))
  end

end
