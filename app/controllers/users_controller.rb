class UsersController < ApplicationController
	def login
	end

	def register
	end

	def edit

	end

	def show
		@user = User.find_by_username(params[:id])
    	#@user = User.find(params[:id])
  	end
  	def create
    	@user = User.new(params[:user])
  		if @user.save
  	    	redirect_to @user
  	 	 else
  	    	render 'new'
		end
	end
	def new
    	@user = User.new
  	end
end
