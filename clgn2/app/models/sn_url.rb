class SnUrl < ActiveRecord::Base
  attr_accessible :sn_code_id, :value

  belongs_to :sn_code
end
