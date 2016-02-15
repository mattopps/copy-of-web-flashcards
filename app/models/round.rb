class Round < ActiveRecord::Base

   validates :correct_first_try, presence: true

  belongs_to :user
  belongs_to :deck
  has_many   :guesses

end
