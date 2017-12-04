class User < ApplicationRecord
  has_secure_password
  has_one :profile
  attr_accessor :reset_token
  #has_many :reviews

  validates :email, presence: {message: "Please provide email address"}, on: :create
  validates :email, uniqueness: {message: "This email adress is taken"}, on: :create
  validates :email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "%Email format not valid" }, on: :create
  validates :password, length: {minimum: 2, too_short: "your password is too short"}, on: :create
  validates :password, length: {maximum: 8, too_long: "Your password is too long"}, on: :create

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end


  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end




end
