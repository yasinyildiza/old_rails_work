class CreateNotifications < ActiveRecord::Migration
  def up
    create_table :notifications do |t|
      t.references :notification_type
      t.references :notification_status, :default => 1
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :mail
      t.string :phone_number
      t.string :subject
      t.string :content
      t.datetime :day
      t.datetime :hour
      t.timestamps
    end
  end
  def down
  end
end
