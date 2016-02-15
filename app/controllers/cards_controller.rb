#show one card
get '/cards' do
  @card = Card.find_by(params[:id])
erb :'card/index'
end


#where it goes when the card gets answered?
put '/cards/:id' do
  card = Card.find(params[:id])
  card.update(params[:answer])
end
