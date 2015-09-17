class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(email: params[:email])
			if @user and @user.password == params[:password]
				session[:user_id] = @user.id 
				redirect_to '/news', notice: "Logged in!"
			else
				redirect_to login_path, notice: "Login info was incorrect"
			end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/', notice: "logged out"
	end

end