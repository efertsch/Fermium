helpers do

	def current_user
		# session[:user_id] ? User.find(session[:user_id]) : nil
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def login
		session[:user_id] = @user.id
	end

	def logout
		session.destroy
	end

	def logged_in?
		current_user ? true : false
	end

end
