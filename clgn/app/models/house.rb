class House < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :town
  has_one :sn_code

  attr_accessible	:user_id,
                  :city_id,
                  :town_id,
                  :heading,
          				:ad_type,
                  :building_condition,
                  :heating_type,
          				:housing_type,
                  :status_of_use,
                  :fuel_type,
          				:price,
                  :currency,
          				:number_of_rooms,
          				:number_of_living_rooms,
          				:number_of_bathrooms,
          				:number_of_balconies,
          				:m2,
          				:age_of_building,
          				:number_of_floors_in_the_building,
          				:on_floor,
          				:due,
                  :due_currency,
          				:advanced_payment,
                  :advanced_payment_currency,
          				:for_student_single
end
