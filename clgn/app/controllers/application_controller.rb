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

  def createSnCode(item)
    SnCode.count + 1
  end

  def set_locale_from_url
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options={})  
    set_locale_from_url
    { :locale => I18n.locale }
  end
end
