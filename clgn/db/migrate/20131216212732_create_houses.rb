class CreateHouses < ActiveRecord::Migration
  def up
    create_table :houses do |t|
      t.references :user
      t.references :city
      t.references :town
      t.integer :ad_type
      t.integer :building_condition
      t.integer :heating_type
      t.integer :housing_type
      t.integer :status_of_use
      t.integer :fuel_type
      t.string :heading
      t.integer :price
      t.integer :currency
      t.integer :number_of_rooms
      t.integer :number_of_living_rooms
      t.integer :number_of_bathrooms
      t.integer :number_of_balconies
      t.integer :m2
      t.integer :age_of_building
      t.integer :number_of_floors_in_the_building
      t.integer :on_floor
      t.integer :due
      t.integer :due_currency
      t.integer :advanced_payment
      t.integer :advanced_payment_currency
      t.boolean :for_student_single
      t.timestamps
    end
  end
  def down
  	drop_table :houses
  end
end
