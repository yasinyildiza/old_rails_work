class User < ActiveRecord::Base
  has_many :notifications

  attr_accessible :first_name, :last_name, :mail, :phone_number, :password_digest

  validates_presence_of :first_name, :last_name, :mail
  validates_uniqueness_of :mail

  def full_name
  	first_name + " " + last_name
  end
end
