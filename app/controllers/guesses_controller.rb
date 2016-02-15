post '/guess' do

  @round_id = params[:round_id]
  card_id = params[:card_id]
  @card = Card.find(card_id)
  @correct = if (params[:answer] == Card.find(params[:card_id]).answer)
                1
            else
                0
            end
  Guess.create(round_id: @round_id, card_id: params[:card_id], correct: @correct)

  redirect "rounds/#{@round_id}/#{@correct}"

end
