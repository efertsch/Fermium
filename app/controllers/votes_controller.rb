post '/questions/:id/votes' do 
	@question = Question.find_by(id: params[:id])
	vote = @question.votes.new(user_id: current_user.id)
	if vote.save
		redirect "/questions/#{@question.id}"
	else
		erb :'/questions/show'
	end
end 