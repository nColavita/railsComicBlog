class PostsController < ApplicationController

def new
end

def index
  @post = Post.new
  @posts = Post.all
end

 
def create 
 @user = User.find_by(email: params[:email])
 if @user and @user.password == params[:password]
     session[:user_id] = @user.id 
     redirect_to posts_path, notice: "logged in!"
     
else 
     redirect_to login_path, notice: "Login info was not correct!"
  end
end
    
def destroy
     session[:user_id] = nil 
     redirect_to posts_path, notice: "logged out!"
	end
end