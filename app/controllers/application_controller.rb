class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user

  private
  def current_user
    @current_user ||= Customer.find(session[:traveller_id]) if session[:customer_id]
    @current_user ||= Caterer.find(session[:agency_id]) if session[:caterer_id]
  end

end
