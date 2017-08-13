class ReturnValue < ActiveRecord::Base
  belongs_to :method_member
  belongs_to :data_type
  attr_accessible :description, :warning, :method_member_id, :data_type_id
  validates :method_member_id, presence: true, uniqueness: :true
  validates :data_type_id, presence: true
end
