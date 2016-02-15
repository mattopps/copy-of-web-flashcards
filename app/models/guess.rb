class Guess < ActiveRecord::Base
  validates :correct, presence: true

  belongs_to :round
  belongs_to :card
end
