class Contract < ApplicationRecord
  #belongs_to :profile
  #belongs_to :job
  validates :accept_status, presence: true
 
end