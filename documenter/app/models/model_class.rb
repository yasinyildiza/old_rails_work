class ModelClass < ActiveRecord::Base
  has_many :data_members, dependent: :destroy
  has_many :method_members, dependent: :destroy
  belongs_to :project
  belongs_to :class_type
  belongs_to :parent_class, :class_name => "ModelClass", :foreign_key => "parent_model_class_id"
  has_many :child_classes, :class_name => "ModelClass", :foreign_key => "parent_model_class_id"
  has_and_belongs_to_many :owner_classes, :class_name => "ModelClass", :join_table => "model_class_ownerships", :foreign_key => "model_class_id", :association_foreign_key => "owner_class_id"
  has_and_belongs_to_many :owned_classes, :class_name => "ModelClass", :join_table => "model_class_ownerships", :foreign_key => "owner_class_id", :association_foreign_key => "model_class_id"
  attr_accessible :description, :name, :warning, :project_id, :class_type_id, :parent_model_class_id, :owner_class_ids, :abstract
  validates :name, presence: true
  validates :project_id, presence: true
  validates :class_type_id, presence: true
  validates_uniqueness_of :name, :scope => [:project_id]
end
