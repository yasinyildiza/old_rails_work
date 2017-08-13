class CreateModelClassOwnerships < ActiveRecord::Migration
  def change
    create_table :model_class_ownerships do |t|
      t.integer :owner_class_id
      t.integer :model_class_id
      t.timestamps
    end
  end
end
