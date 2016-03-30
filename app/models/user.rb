require 'bcrypt'
class User < ActiveRecord::Base
  has_many :comments
  has_many :questions
  has_many :answers
  has_many :votes

  validates :email, :username, presence: true
  validates :email, uniqueness: true
  validate :password_validation

  include BCrypt

  def authenticate(plain_password)
    self.password == plain_password
  end

  def password
    @password ||= Password.new(password_hash)
  end



  def password=(new_password)
    @plain_text_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def password_validation
    if @plain_text_password.nil?
      errors.add(:password, "Password is required")
    elsif @plain_text_password.length < 5
      errors.add(:password, "Password length must be at least 5")
    end
  end
end
