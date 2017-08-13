class ArchivedNotification < ActiveRecord::Base
  attr_accessible :notification_type_id, :notification_status_id :user_id, :first_name, :last_name, :mail, :phone_number, :subject, :content, :day, :hour
end
