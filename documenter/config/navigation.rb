# -*- coding: utf-8 -*-

# Configures your navigation

SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |header|

    if current_user
      header.item(:new_ad, (t "navigation.new_ad"), '#', :class => 'model-group') do |new_ad|
        new_ad.item :english, (t "ad_categories.house"), new_house_path
        new_ad.item :turkish, (t "ad_categories.car"), new_house_path
      end
    end

    header.item(:search, (t "navigation.search"), '#', :class => 'model-group') do |search|
      search.item :search_house, (t "ad_categories.house"), houses_path
      search.item :search_car, (t "ad_categories.car"), houses_path
    end

    header.item(:languages, (t "navigation.language"), '#', :class => 'model-group') do |lang|
      lang.item :english, (t "languages.english"), url_for(:locale => "en")
      lang.item :turkish, (t "languages.turkish"), url_for(:locale => "tr")
    end

    if current_user
      header.item(:user, current_user.real_user.name, '#', :class => 'model-group') do |user|
      	user.item :my_ads, (t "login.my_ads"), houses_path(:user_id => current_user.id)
      	user.item :edit_profile, (t "login.edit_profile"), edit_user_path(current_user)
        user.item :signout, (t "login.sign_out"), destroy_user_session_path, :method => "delete"
      end
    else
      header.item(:signup, (t "login.sign_up"), new_user_path, :class => 'model-group') do |sign_up|
        sign_up.item :person, (t "person"), new_person_path
        sign_up.item :company, (t "company"), new_company_path
      end
      header.item(:signin, (t "login.sign_in"), new_user_session_path, :class => 'model-item')
	  end
	end
end