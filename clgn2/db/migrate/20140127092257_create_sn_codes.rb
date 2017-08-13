class CreateSnCodes < ActiveRecord::Migration
  def up
    create_table :sn_codes do |t|
      t.string :value
      t.references :user
      t.integer :number_of_digits
      t.string :short_name
      t.timestamps
    end
  end

  def down
  	drop_table :sn_codes
  end
end
