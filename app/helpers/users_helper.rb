module UsersHelper

	def  showuserCerror(field)
		render 'shared/error_messages', :field => field
	end
end
