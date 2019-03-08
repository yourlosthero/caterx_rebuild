class Package < ApplicationRecord

	before_save :titleize

	serialize :location, JSON
	serialize :category, JSON

	##############################################################################################################

	# CARRIERWAVE PICTURE UPLOADER

	mount_uploader :i1, CaterXUploader
	mount_uploader :i2, CaterXUploader
	mount_uploader :i3, CaterXUploader
	mount_uploader :i1, CaterXUploader
	mount_uploader :i2, CaterXUploader
	mount_uploader :i3, CaterXUploader
	mount_uploader :i4, CaterXUploader
	mount_uploader :i5, CaterXUploader
	mount_uploader :i6, CaterXUploader
	mount_uploader :i7, CaterXUploader

	##############################################################################################################

	validates :name, length: {maximum: 60}, uniqueness: true

	##############################################################################################################

    # TITLEIZE

    def titleize
	    self.packagename = self.packagename.titleize
	end
	
	##############################################################################################################

end