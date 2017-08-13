class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable, 
         :timeoutable,
         :timeout_in => 30.minutes

  attr_accessible :email, :password, :password_confirmation, :remember_me

  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true,
                       length: { :minimum => 8, :maximum => 15 },
                       confirmation: true, 
                       format: {:with => /^(?=.*[a-z])(?=.*([A-Z]))(?=.*\d).+/},
                       on: :create
end