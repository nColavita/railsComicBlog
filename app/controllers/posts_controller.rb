class PostsController < ApplicationController
	before_action :set_chirp, only: [:show]
	
def index
  @posts = Post.all
  @post = Post.new
end

def new
	@post = Post.new
end

def show

end

def create
	@post = Post.create(post_params)
	redirect_to posts_path, notice: "New post created!"
end

private
	def post_params
		params.require(:post).permit(:body).merge(user: current_user)
	end

	def set_post
		begin
			@post = Post.find(params[:id])
		rescue
			flash[:notice] = "That post was not found!"
			redirect_to posts_path
		end
	end
end