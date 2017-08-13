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


  validates_presence_of :email                        

  validates :password_confirmation, :presence =>true, :on => :create
  validates :password, :presence =>true,
                       :length => { :minimum => 8, :maximum => 15 },
                       :confirmation =>true, 
                       :format => {:with => /^(?=.*[a-z])(?=.*([A-Z]))(?=.*\d).+/},
                       :on => :create

  validates_uniqueness_of :email

  attr_accessible :user_type, :email, :password, :password_confirmation, :remember_me
end