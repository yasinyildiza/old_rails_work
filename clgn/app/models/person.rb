class Person < ActiveRecord::Base
  belongs_to :user
  has_many :houses, through: :user
  attr_accessible :user_id, :first_name, :last_name, :phone_number, :birthday, :user_attributes

  accepts_nested_attributes_for :user

  def name
  	"#{first_name} #{last_name}"
  end
end
