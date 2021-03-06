class ApplicationController < ActionController::Base
  include Admin::AdminHelper
  before_action :configure_permitted_parameters, if: :devise_controller? 
  helper_method :already_attending
  

  def event_creator?
    unless current_user == Event.find(params[:event_id]).creator
      flash[:danger] = "You can't access it as you are not the creatoristrator"
      redirect_back(fallback_location: root_path)
    end
  end

  def already_attending
    if Event.find(params[:event_id]).attendees.include?(current_user)
      flash[:danger] = "You are already attending this event"
      redirect_back(fallback_location: root_path)
    end
  end

  def creator_cannot_attend_own_event
    if current_user == Event.find(params[:event_id]).creator
      flash[:danger] = "Vous ne pouvez pas vous inscrire à un événement que vous creatoristrez"
      redirect_back(fallback_location: root_path)
    end
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :description])
  end


end
