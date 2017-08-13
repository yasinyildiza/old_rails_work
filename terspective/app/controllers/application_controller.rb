class ApplicationController < ActionController::Base
  before_filter :require_login
  before_filter :preload
  
  def require_login
    unless params[:controller] == 'devise/sessions' and params[:action] == 'new'
      flash[:alert] = I18n.t("alerts.require_login") unless current_user
      redirect_to '/login' unless current_user 
    end
  end

  def preload
  end
end
