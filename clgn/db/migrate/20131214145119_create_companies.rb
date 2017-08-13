class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.references :user
      t.string :name
      t.string :authorized_person
      t.string :phone_number
      t.string :website
      t.timestamps
    end
  end
  def down
  	drop_table :companies
  end
end
