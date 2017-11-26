class Job < ApplicationRecord
	has_many :contracts
  belongs_to :profile

  geocoded_by :location
  after_validation :geocode

end
