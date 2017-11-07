class Profile < ApplicationRecord
  belongs_to :user
  #has_many :contract
  #has_one :payment
  has_many :reviews
  validates :address, presence: { message: "please provide address"}
  validates :phone_num, presence: {message: "please provide phone num"}
  #validates :email, presence: {message: "please provide email address"}, on: :create
  #validates :email, uniqueness: {message: "%{value} already exist"}, on: :create
  #validates_format_of :email,:with => Devise::email_regexp, on: :create
  #validates :email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "%{value} format not valid" }, on: :create

end
