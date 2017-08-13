class City < ActiveRecord::Base
  has_many :towns, dependent: :destroy
  has_many :houses, through: :towns
  attr_accessible :name
end
