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
  	@sorted_projects = Project.order("name ASC")
    unsorted_categories = Category.order("name ASC")
    general_category = Category.find(1);
    @sorted_categories = Array.new
    @sorted_categories << general_category
    unsorted_categories.each do |category|
      if category != general_category
        @sorted_categories << category
      end
    end
  end
end
