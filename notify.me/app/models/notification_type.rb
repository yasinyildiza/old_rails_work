class NotificationType < ActiveRecord::Base
  has_many :notificaitons

  attr_accessible :name

  validates :name, :uniqueness => true
end
