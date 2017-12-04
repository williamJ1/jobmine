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
    @average_rating = (@value.to_f) / (@total.to_f)

    if @average_rating >= 4.0
      if (@total/10) > profile.rating_star
        @stars = profile.rating_star + 1
        profile.update_attributes(rating_star: @stars)
      elsif (@total/10) < profile.rating_star
        @stars = profile.rating_star - 1
        profile.update_attributes(rating_star: @stars)
      end
    end

    profile.update_attributes(average_rating: @average_rating)
  end

end
