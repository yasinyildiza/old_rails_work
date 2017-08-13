class CreatePeople < ActiveRecord::Migration
  def up
    create_table :people do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.date :birthday
      t.timestamps
    end
  end
  def down
  	drop_table :people
  end
end
