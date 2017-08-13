class CreateSkillLevels < ActiveRecord::Migration
  def change
    create_table :skill_levels do |t|
      t.string :name
      t.integer :minimum_years
      t.integer :maximum_years

      t.timestamps
    end
  end
end
