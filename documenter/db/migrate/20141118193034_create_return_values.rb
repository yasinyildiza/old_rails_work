class CreateReturnValues < ActiveRecord::Migration
  def change
    create_table :return_values do |t|
      t.references :method_member
      t.references :data_type
      t.string :description
      t.string :warning

      t.timestamps
    end
    add_index :return_values, :method_member_id
    add_index :return_values, :data_type_id
  end
end
