class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  helper_method :is_admin?, :already_attending
  def is_admin?
    unless current_user == Event.find(params[:id]).admin
      flash[:danger] = "You can't access it as you are not the administrator"
      redirect_back(fallback_location: root_path)
    end
  end

  def event_admin?
    unless current_user == Event.find(params[:event_id]).admin
      flash[:danger] = "You can't access it as you are not the administrator"
      redirect_back(fallback_location: root_path)
    end
  end

  def already_attending
    if Event.find(params[:event_id]).attendees.include?(current_user)
      flash[:danger] = "You are already attending this event"
      redirect_back(fallback_location: root_path)
    end
  end

  def admin_cannot_attend_own_event
    if current_user == Event.find(params[:event_id]).admin
      flash[:danger] = "Vous ne pouvez pas vous inscrire à un événement que vous administrez"
      redirect_back(fallback_location: root_path)
    end
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :description])
  end


end
