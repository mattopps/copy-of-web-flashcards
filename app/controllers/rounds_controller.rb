get '/rounds/:id/:correct' do

  @correct = {'1' => "Correct!", '0' => "Incorrect."}[params[:correct]]
  @round_id = params[:id]
  cards = Round.find(params[:id]).deck.cards
  # eliminate all cards that we've already answered correctly
  cards = cards.select{|card| !card.guesses.any?{|guess| guess.correct == 1}}

  if cards.count <= 0
    redirect "/users/#{current_user.id}"
  end
  @card = cards.sample

  erb :'rounds/index'

end

get '/rounds/:id' do

  @round_id = params[:id]
  cards = Round.find(params[:id]).deck.cards.to_a
  cards.delete_if{|card| Guess.find_by(round_id: @round_id, card_id: card.id) && Guess.find_by(round_id: @round_id, card_id: card.id).correct == 1}
  @card = cards.sample

  erb :'rounds/index'

end

# post '/rounds/:id' do

#   @round_id = params[:id]
#   card_id = params[:card_id]
#   @card = Card.find(card_id)
#   @correct = if (params[:answer] == Card.find(params[:card_id]))
#                 1
#             else
#                 0
#             end
#   Guess.create(round_id: params[:id], card_id: params[:card_id], correct: @correct)

#   erb :'rounds/index'

# end

# post '/rounds/' do
#   "Hello World"
# end
