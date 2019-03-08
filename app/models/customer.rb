class Customer < ApplicationRecord

	# CONFIRM PASSWORD

	attr_accessor :confirm_password

	##############################################################################################################

	# OMNIAUTH USER CREATION

	def self.from_omniauth(auth)
  		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    		user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.email = auth.info.email
			user.avatar = auth.info.image.split('http').join('https') + "?height=500"
			user.oauth_token = auth.credentials.oauth_token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.save!
  		end
	end

	##############################################################################################################

  	# USE UID INSTEAD OF ID IN PROFILE URL

	def to_param
		uid
	end

	##############################################################################################################

end