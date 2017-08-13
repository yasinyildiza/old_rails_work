class CreateMethodMembers < ActiveRecord::Migration
  def change
    create_table :method_members do |t|
      t.references :model_class
      t.string :name
      t.references :method_type
      t.boolean :override, :default => false
      t.string :description
      t.string :warning

      t.timestamps
    end
    add_index :method_members, :model_class_id
    add_index :method_members, :method_type_id
  end
end
