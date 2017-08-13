class AdCategory < ActiveEnum::Base
	value :id => 1, :name => I18n.t('house')
	value :id => 2, :name => I18n.t('car')
end