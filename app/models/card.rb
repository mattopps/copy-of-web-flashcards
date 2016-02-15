class Card < ActiveRecord::Base

  validates :question, presence: true
  validates :answer, presence: true

  belongs_to :deck
  has_many :rounds, through: :deck
  has_many :guesses




end
