class UserType < ActiveEnum::Base
	value :id => 1, :name => I18n.t('person')
	value :id => 2, :name => I18n.t('company')
end