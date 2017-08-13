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


  has_one :person, dependent: :destroy
  has_one :company, dependent: :destroy
  has_many :houses, dependent: :destroy

  validates_presence_of :email                        

  validates :password_confirmation, :presence =>true, :on => :create
  validates :password, :presence =>true,
                       :length => { :minimum => 8, :maximum => 15 },
                       :confirmation =>true, 
                       :format => {:with => /^(?=.*[a-z])(?=.*([A-Z]))(?=.*\d).+/},
                       :on => :create

  validates_uniqueness_of :email

  attr_accessible :user_type, :email, :password, :password_confirmation, :remember_me, :person_attributes, :company_attributes

  accepts_nested_attributes_for :person, :company

  def real_user
  	if user_type == 1
  		person
  	elsif user_type == 2
  		company
  	else
  		nil
  	end
  end
end