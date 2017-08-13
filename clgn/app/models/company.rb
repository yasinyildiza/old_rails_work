class Company < ActiveRecord::Base
  belongs_to :user
  has_many :houses, through: :user
  attr_accessible :user_id, :name, :authorized_person, :phone_number, :website, :user_attributes

  accepts_nested_attributes_for :user
end
