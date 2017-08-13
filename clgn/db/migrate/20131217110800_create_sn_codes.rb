class CreateSnCodes < ActiveRecord::Migration
  def up
    create_table :sn_codes do |t|
      t.references :house
      t.string :code
      t.timestamps
    end
  end
  def down
  	drop_table :sn_codes
  end
end
