class BuildingCondition < ActiveEnum::Base
	value :id => 1, :name => I18n.t('build_conditions.brand_new')
	value :id => 2, :name => I18n.t('build_conditions.second_hand')
	value :id => 3, :name => I18n.t('build_conditions.under_construction')
end