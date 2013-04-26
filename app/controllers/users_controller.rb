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
end
