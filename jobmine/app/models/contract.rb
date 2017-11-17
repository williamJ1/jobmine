class Contract < ApplicationRecord
  belongs_to :profile
  belongs_to :job
  has_many :timeslots
  has_many :reviews
  validates :accept_status, presence: true
end