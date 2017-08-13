# -*- coding: utf-8 -*-

# Configures your navigation

SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |header|

    header.item(:new, (t "new_sn_code"), new_sn_url_path, :class => 'model-item')
    header.item(:search, (t "search_sn_code"), sn_url_search_path, :class => 'model-item')

    if current_user
      header.item(:user, current_user.email, '#', :class => 'model-group') do |user|
      	user.item :edit_profile, (t "login.edit_profile"), edit_user_path(current_user)
        user.item :signout, (t "login.sign_out"), destroy_user_session_path, :method => "delete"
      end
    else
      header.item(:signup, (t "login.sign_up"), new_user_path, :class => 'model-item')
      header.item(:signin, (t "login.sign_in"), new_user_session_path, :class => 'model-item')
	  end

    header.item(:languages, (t "navigation.language"), '#', :class => 'model-group') do |lang|
      lang.item :english, (t "languages.english"), url_for(:locale => "en")
      lang.item :turkish, (t "languages.turkish"), url_for(:locale => "tr")
    end
	end
end