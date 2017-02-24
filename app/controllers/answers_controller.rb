get '/questions/:id/answers/new' do

	@question = Question.find_by(id: params[:id])
  erb :'/answers/new'

end

post '/questions/:id' do
  @question = Question.find_by(id: params[:id])
	@answer = @question.answers.new(params[:answer])
  @answer.user_id = current_user.id
	if @answer.save
		redirect "/questions/#{@question.id}"
	else
		erb :'/answers/new'
end

end
