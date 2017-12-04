class Review < ApplicationRecord
	belongs_to :profile
	belongs_to :contract

	after_create :update_profile_rating
	after_update :update_profile_rating
	after_destroy :update_profile_rating

	validates :body, length: { minimum: 1 }
	validates :rating, presence: true
	validates :title, presence: true
	validates :reviewer, presence: true

	def update_profile_rating
		profile = Profile.find_by(id: self.profile_id)
		if profile != nil
			profile.update_average_rating(self.profile_id)
		end
	end
end
