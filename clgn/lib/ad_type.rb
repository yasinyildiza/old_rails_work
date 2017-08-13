class AdType < ActiveEnum::Base
	value :id => 1, :name => I18n.t('ad_types.for_rent')
	value :id => 2, :name => I18n.t('ad_types.for_sale')
end