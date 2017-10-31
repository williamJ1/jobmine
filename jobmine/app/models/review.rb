class Review < ApplicationRecord
	validates :body, length: { minimum: 1 }
	validates :rating, presence: true
end
