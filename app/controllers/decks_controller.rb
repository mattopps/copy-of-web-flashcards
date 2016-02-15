#index
get '/' do
  redirect '/decks'
end

get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do
  deck_num = (params[:id])
  round = Round.create(user_id: current_user.id, deck_id: deck_num)
  current_user.rounds << round
  redirect "rounds/#{round.id}"
end

#create
# post '/decks' do
#   deck = Deck.new
# end

#edit
# get '/decks/:id/edit' do
#   deck = Deck.find(params[:id])
#   deck.update(params[:name])
#   deck.save
# end

#update

#delete
# delete '/decks' do
#   @deck = Deck.find(params[:id])
#end
