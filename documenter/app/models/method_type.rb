class MethodType < ActiveRecord::Base
  has_many :methods, dependent: :destroy
  attr_accessible :description, :name, :character
  validates :name, presence: true, uniqueness: true
  validates :character, presence: true, uniqueness: true
end
