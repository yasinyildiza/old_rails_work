class Project < ActiveRecord::Base
  has_many :model_classes, dependent: :destroy
  attr_accessible :code, :description, :name
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
end