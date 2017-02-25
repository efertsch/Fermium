get '/questions' do
	@questions = Question.all.order(created_at: :desc)
	erb :'/questions/index'
end

get '/questions/new' do
		erb :'/questions/new'
end

get '/questions/:id' do
	@question = Question.find_by(id: params[:id])
	erb :'/questions/show'
end

post '/questions' do
	@question = Question.new(params[:question])
	@question.user_id = current_user.id
	if @question.save
		redirect "/questions/#{@question.id}"
	else
		erb :'/questions/new'
		# not valid user error message
	end
end


post '/questions/:id/comments' do
	redirect '/sessions/new' unless current_user
	@question = Question.find(params[:id])
	@comment = @question.comments.new(user: current_user, comment_text: params[:comment_text])
	if @comment.save
		if request.xhr?
			# erb :comment, layout: false
		else
			redirect "/questions/#{params[:id]}"
		end
	else
		"get fucked or something more profess"
	end
end

