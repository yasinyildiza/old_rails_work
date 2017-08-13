class Work < ActiveRecord::Base
	belongs_to :category
	belongs_to :project
	has_many :images, :dependent => :destroy
	attr_accessible :category_id, :project_id, :name, :description, :images_attributes
	accepts_nested_attributes_for :images

	validates :name, presence: true
	validates :category_id, presence: true
	#validates :project_id, presence: true

	validates_uniqueness_of :name, :scope => [:category_id, :project_id]

	def next_image_version
		version = 0
        if images.count == 0
          version = 1
        else
          version = images.order("version ASC").last.version + 1
        end
        version
	end
end
