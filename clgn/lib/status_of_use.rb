class StatusOfUse < ActiveEnum::Base
	value :id => 1, :name => I18n.t('status_of_uses.empty')
	value :id => 2, :name => I18n.t('status_of_uses.tennant_live_in')
	value :id => 3, :name => I18n.t('status_of_uses.owner_lives_in')
	value :id => 4, :name => I18n.t('status_of_uses.unspecified')
end