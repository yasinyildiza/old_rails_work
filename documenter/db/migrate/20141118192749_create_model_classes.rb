class CreateModelClasses < ActiveRecord::Migration
  def change
    create_table :model_classes do |t|
      t.references :project
      t.string :name
      t.references :class_type
      t.boolean :abstract, :default => false
      t.string :description
      t.string :warning
      t.integer :parent_model_class_id

      t.timestamps
    end
    add_index :model_classes, :project_id
    add_index :model_classes, :class_type_id
  end
end
