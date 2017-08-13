class CreateSnUrls < ActiveRecord::Migration
  def up
    create_table :sn_urls do |t|
      t.references :sn_code
      t.string :value
      t.timestamps
    end
  end

  def down
  	drop_table :sn_urls
  end
end
