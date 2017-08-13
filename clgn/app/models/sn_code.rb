class SnCode < ActiveRecord::Base
  belongs_to :house

  attr_accessible :house_id, :code

  validates_presence_of :house_id, :code
  validates_uniqueness_of :house_id, :code
end
