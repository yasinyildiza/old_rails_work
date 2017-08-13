class ModelClassOwnership < ActiveRecord::Base
  has_many :owner_classes, :class_name => "ModelClass", :foreign_key => "owner_class_id"
  has_many :model_classes, :class_name => "ModelClass", :foreign_key => "model_class_id"
  attr_accessible :owner_class_id, :model_class_id
end
