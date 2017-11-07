class User < ApplicationRecord
  has_secure_password
  has_one :profile
  #attr_accessor :password

  validates :email, presence: {message: "Please provide email address"}, on: :create
  validates :email, uniqueness: {message: "This email adress is taken"}, on: :create
  validates :email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "%Email format not valid" }, on: :create
  validates :password, length: {minimum: 2, too_short: "your password is too short"}, on: :create
  validates :password, length: {maximum: 8, too_long: "Your password is too long"}, on: :create


  #has_many :reviews
end
