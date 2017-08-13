class CreateNotificationStatuses < ActiveRecord::Migration
  def up
    create_table :notification_statuses do |t|
      t.string :name
      t.timestamps
    end
  end
  def down
  	drop_table :notification_statuses
  end
end
