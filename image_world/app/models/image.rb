class Image < ActiveRecord::Base
	belongs_to :work
	attr_accessible :work_id, :version, :note, :image_file, :remove_image

	#validates :work_id, presence: true
	#validates :version, presence: true
	validates :image_file, presence: true

	mount_uploader :image_file, ImageUploader
end
