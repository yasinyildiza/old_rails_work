class HousingType < ActiveEnum::Base
	value :id => 1, :name => I18n.t('housing_types.garden_dublex')
	value :id => 2, :name => I18n.t('housing_types.garden_floor')
	value :id => 3, :name => I18n.t('housing_types.roof_dublex')
	value :id => 4, :name => I18n.t('housing_types.apartment')
	value :id => 5, :name => I18n.t('housing_types.dublex')
	value :id => 6, :name => I18n.t('housing_types.family_house')
	value :id => 7, :name => I18n.t('housing_types.house')
	value :id => 8, :name => I18n.t('housing_types.triplex')
	value :id => 9, :name => I18n.t('housing_types.fourlex')
end