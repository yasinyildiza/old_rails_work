class Currency < ActiveEnum::Base
	value :id => 1, :name => I18n.t('currencies.tl')
	value :id => 2, :name => I18n.t('currencies.dolar')
	value :id => 3, :name => I18n.t('currencies.euro')
end