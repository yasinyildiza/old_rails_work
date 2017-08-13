class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :require_login

  private

  def require_login
    unless params[:controller] == 'devise/sessions' and params[:action] == 'new'
      flash[:alert] = I18n.t("alerts.require_login") unless current_user
      redirect_to '/login' unless current_user 
    end
  end

  def catch_exceptions
    yield
	  rescue => exception
	  logger.debug "Caught exception! #{exception}"
	  if(Rails.env == 'production')
	    render "errors/application_error"
	  else
	    raise
	  end
  end

  def createSnCode(item, number_of_digits, short_name)
    unless short_name.nil?
      short_name_check = SnCode.find_all_by_short_name(short_name)
      if short_name_check.length > 0
        return -1
      end
    end
    upper_limit = 10**number_of_digits
    lower_limit = 10**(number_of_digits - 1)
    puts 
    digit_check = SnCode.find_all_by_number_of_digits(number_of_digits)
    if digit_check.length > upper_limit - lower_limit
      return -2
    end
    code = lower_limit + Random.rand(upper_limit - lower_limit)
    sn_code = SnCode.new(:value => code)
    if sn_code.save
      sn_code.update_attribute("short_name", short_name) unless short_name.nil?
      sn_code.update_attribute("number_of_digits", number_of_digits.to_i)
      sn_code.update_attribute("user_id", current_user.id) if current_user
      item.update_attribute("sn_code_id", sn_code.id)
      return 0
    else
      puts "recreating sn code"
      createSnCode(item, number_of_digits, short_name)
    end
  end

  def set_locale_from_url
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options={})  
    set_locale_from_url
    { :locale => I18n.locale }
  end
end
