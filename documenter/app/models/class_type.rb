class ClassType < ActiveRecord::Base
  has_many :classes, dependent: :destroy
  attr_accessible :description, :name
  validates :name, presence: true, uniqueness: true
end
