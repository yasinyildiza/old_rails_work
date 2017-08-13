class MethodParameter < ActiveRecord::Base
  belongs_to :method_member
  belongs_to :data_type
  attr_accessible :description, :name, :warning, :method_member_id, :data_type_id
  validates :name, presence: true
  validates :method_member_id, presence: true
  validates :data_type_id, presence: true
  validates_uniqueness_of :name, :scope => [:method_member_id]
end
