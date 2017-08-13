class CreateMethodParameters < ActiveRecord::Migration
  def change
    create_table :method_parameters do |t|
      t.references :method_member
      t.string :name
      t.references :data_type
      t.string :description
      t.string :warning

      t.timestamps
    end
    add_index :method_parameters, :method_member_id
    add_index :method_parameters, :data_type_id
  end
end
