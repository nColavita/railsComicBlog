class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :destroy, :update, :follow, :unfollow]

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
end

def profile
	@user = current_user
	render :show
end

def edit

end

def destroy
	@user.destroy
	session[:user_id] = nil
	redirect_to root_path, notice: "Account Deleted"
end


	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :fname, :lname)
		end

		def set_user
		        begin
		            if params[:username]
		                username = params[:username]
		                @user = User.where("lower(username) = ?", username.downcase).first 
		                unless @user 
		                    flash[:notice] = "That user could not be found."
		             redirect_to users_path
		                end
		            else
		                @user = User.find(params[:id])
		            end
		        rescue 
		             flash[:notice] = "That user could not be found."
		             redirect_to users_path
		        end
		    end

end