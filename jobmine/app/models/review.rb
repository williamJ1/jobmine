class Review < ApplicationRecord
	belongs_to :profile

	validates :body, length: { minimum: 1 }
	validates :rating, presence: true
end
