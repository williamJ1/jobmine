class Job < ApplicationRecord
	has_many :contracts
  belongs_to :profile
end
