class UsersController < ApplicationController

def index
	@users = User.all
end

def new
	@user = User.new
end

def create
	@user = User.create(user_params)
	session[:user_id] = @user.id
	redirect_to '/news', notice: "New User Created!"
end

def show
	@user = current_user
end

def profile
	@user = current_user
	render :show
end

def edit
	@user = current_user
end

def destroy
	@user.destroy
	session[:user_id] = nil
	redirect_to root_path, notice: "Account Deleted"
end

def list
	@users = User.all
end


	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :fname, :lname)
		end
end