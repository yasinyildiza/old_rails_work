class DataType < ActiveRecord::Base
  has_many :data_members, dependent: :destroy
  has_many :return_values, dependent: :destroy
  has_many :method_parameters, dependent: :destroy
  attr_accessible :description, :name
  validates :name, presence: true, uniqueness: true
end
