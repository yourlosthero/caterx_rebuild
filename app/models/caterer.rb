class Caterer < ApplicationRecord

	attr_accessor :confirm_password

	serialize :location, JSON

	##############################################################################################################

	# CARRIERWAVE PICTURE UPLOADER

	mount_uploader :logo, CaterXUploader

	##############################################################################################################

	validates :name, length: {maximum: 60}, uniqueness: true
    validates :phone_1, length: {minimum: 11, maximum: 11}, uniqueness: true

	def to_param
		uid
	end

end