get '/questions' do
	@questions = Question.all
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
	if @question.save
		redirect "/questions/#{@question.id}"
	else
		erb :'/questions/new'
		# not valid user error message
	end
end


