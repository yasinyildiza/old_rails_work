class Notification < ActiveRecord::Base
  belongs_to :notification_type
  belongs_to :notification_status
  belongs_to :user
  
  attr_accessible :notification_type_id, :notification_status_id, :user_id, :first_name, :last_name, :mail, :phone_number, :subject, :content, :day, :hour
  validates_presence_of :notification_type, :user_id, :notification_status_id

  def is_time_to_deliver
  	day_ok = day.strftime("%d/%m/%Y") == Date.today.strftime("%d/%m/%Y")
  	hour_ok = hour.strftime("%I:%M%p") == Time.now.strftime("%I:%M%p")
  	day_ok and hour_ok
  end

  def actual_day
    day.strftime("%d/%m/%Y")
  end

  def actual_hour
    hour.strftime("%I:%M%p")
  end
end
