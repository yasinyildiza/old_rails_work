class SnCode < ActiveRecord::Base
  attr_accessible :value, :number_of_digits, :short_name, :user_id

  belongs_to :user

  has_many :sn_urls, dependent: :destroy

  validates :value, presence: true, uniqueness: true
  validates :short_name, uniqueness: true
end
