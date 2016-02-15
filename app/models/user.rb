require 'bcrypt'
require 'pry'

class User < ActiveRecord::Base

  validates :user_name, presence: true, uniqueness: true, length: {maximum:30}
  validates :password_hash, presence: true
  validates :first_name, presence: true, length: {maximum:30}
  validates :last_name, presence: true, length: {maximum:30}

  has_many :rounds, dependent: :destroy
  has_many :decks, through: :rounds, dependent: :destroy
  has_many :guesses, through: :rounds, dependent: :destroy

  include BCrypt


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
