class Contract < ApplicationRecord
  belongs_to :profile
  belongs_to :job
  has_many :timeslots
  validates :accept_status, presence: true
end