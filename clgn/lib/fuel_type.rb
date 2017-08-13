class FuelType < ActiveEnum::Base
	value :id => 1, :name => I18n.t('fuel_types.natural_gas')
	value :id => 2, :name => I18n.t('fuel_types.coal_wood')
	value :id => 3, :name => I18n.t('fuel_types.heating')
	value :id => 4, :name => I18n.t('fuel_types.electric')
end