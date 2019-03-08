class SessionsController < ApplicationController

	######################################################################################################################################################################

	# Facebook Log In

	def create
		user = Customer.from_omniauth(request.env["omniauth.auth"])
		session[:customer_id] = user.uid
		if cookies[:package_id].present?
		redirect_to package_path(cookies[:package_id])
		else
		redirect_to root_path
		end
	end

	######################################################################################################################################################################

	# Facebook Sign Out

	def signout
		session[:customer_id] = nil
		session[:caterer_id] = nil
		redirect_to root_path
	end

	######################################################################################################################################################################

end