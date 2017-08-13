class CreateMethodTypes < ActiveRecord::Migration
  def change
    create_table :method_types do |t|
      t.string :name
      t.string :character
      t.string :description

      t.timestamps
    end
  end
end
