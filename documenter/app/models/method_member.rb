class MethodMember < ActiveRecord::Base
  has_one :return_value, dependent: :destroy
  has_many :method_parameters, dependent: :destroy
  belongs_to :model_class
  belongs_to :method_type
  attr_accessible :description, :name, :warning, :model_class_id, :method_type_id, :return_value_attributes, :method_parameters_attributes, :override
  validates :name, presence: true
  validates :model_class_id, presence: true
  validates :method_type_id, presence: true
  validates_uniqueness_of :name, :scope => [:model_class_id]
  accepts_nested_attributes_for :return_value, :method_parameters
end
