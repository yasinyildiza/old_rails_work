class Town < ActiveRecord::Base
  has_many :houses
  belongs_to :city
  attr_accessible :name, :city_id
end
