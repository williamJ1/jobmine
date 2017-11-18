class Review < ApplicationRecord
	belongs_to :profile
	belongs_to :contract

	validates :body, length: { minimum: 1 }
	validates :rating, presence: true
end
