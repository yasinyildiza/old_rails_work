class CreateDataMembers < ActiveRecord::Migration
  def change
    create_table :data_members do |t|
      t.references :model_class
      t.string :name
      t.references :data_type
      t.string :default_value
      t.string :calculation
      t.string :description
      t.string :warning

      t.timestamps
    end
    add_index :data_members, :model_class_id
    add_index :data_members, :data_type_id
  end
end
