class Deck < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :rounds
  has_many :users, through: :rounds
  has_many :cards

  def deck_shuffle

  end

end
