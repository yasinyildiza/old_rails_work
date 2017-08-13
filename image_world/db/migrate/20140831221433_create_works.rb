class CreateWorks < ActiveRecord::Migration
  def up
    create_table :works do |t|
      t.references :category
      t.references :project
      t.string :name
      t.string :description
      t.timestamps
    end
  end

  def down
  	drop_table :works
  end
end
