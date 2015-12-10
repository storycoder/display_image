class Gallery < ActiveRecord::Base
	validates :pic, presence: true
	validates :description, presence: true
	mount_uploader :photo, PhotoUploader
end
