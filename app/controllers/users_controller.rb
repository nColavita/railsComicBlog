class UsersController < ApplicationController

def new
	@user = User.new
end

def edit
end

def destroy
end

def list
	@users = User.all
end

end