class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
    	t.references :work
    	t.integer :version
      t.string :note
      t.string :image_file
    	t.timestamps
    end
  end

  def down
  	drop_table :images
  end
end
