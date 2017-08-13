class HeatingType < ActiveEnum::Base
	value :id => 1, :name => I18n.t('heating_types.solar_power')
	value :id => 2, :name => I18n.t('heating_types.radiator')
	value :id => 3, :name => I18n.t('heating_types.air_conditioning')
	value :id => 4, :name => I18n.t('heating_types.gas_boiler')
	value :id => 5, :name => I18n.t('heating_types.central')
	value :id => 6, :name => I18n.t('heating_types.stove')
	value :id => 7, :name => I18n.t('heating_types.geothermal_heating')
	value :id => 8, :name => I18n.t('heating_types.n_a')
	value :id => 9, :name => I18n.t('heating_types.unspecified')
end