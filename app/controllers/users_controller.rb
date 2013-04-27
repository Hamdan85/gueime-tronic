class UsersController < ApplicationController
	def login
	end

	def register
	end

	def edit
	end

	def show
		@user = User.find_by_username(params[:id])
  	end
  	def create
    	@user = User.new(params[:user])
  		if @user.save
  	    	#redirect_to @user
  	    	redirect_to "/usuarios/" + @user.name
  	 	 else
  	    	redirect_to '/registro'
		end
	end
	def new
    	@user = User.new
  	end
end
