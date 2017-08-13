class DataMember < ActiveRecord::Base
  belongs_to :model_class
  belongs_to :data_type
  attr_accessible :calculation, :description, :name, :warning, :model_class_id, :data_type_id, :default_value
  validates :name, presence: true
  validates :model_class_id, presence: true
  validates :data_type_id, presence: true
  validates_uniqueness_of :name, :scope => [:model_class_id]
end
