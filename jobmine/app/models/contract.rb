class Contract < ApplicationRecord
  belongs_to :profile
  belongs_to :job
  has_many :timeslots
  has_many :reviews
  validates :accept_status, presence: true     #0: waiting;  1: reject;  2: accept
end