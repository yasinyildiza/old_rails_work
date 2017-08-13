class Project < ActiveRecord::Base
	has_many :works, :dependent => :destroy
	has_many :images, :through => :works, :dependent => :destroy
	attr_accessible :name, :description, :works_attributes, :images_attributes
	accepts_nested_attributes_for :works, :images

	validates :name, presence: true, uniqueness: true

	def grouped_works
		other_works.group_by { |d| d[:category_id] }
	end

	def general_work
		works.first
	end

	def other_works
		array = Array.new(works)
		array.shift()
		array
	end
end
