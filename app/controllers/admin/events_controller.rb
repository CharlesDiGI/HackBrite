class Admin::EventsController < ApplicationController
  include Admin::AdminHelper
  before_action :authenticate_user!
  before_action :is_admin?

  def update
    @event = Event.find(params[:id])
    puts params
    puts "*" * 40
      if params[:admin_choice] == "Validate event"
        @event.event_status_ids = [2]
        @event.save
        flash[:success] = "Event accepté"
        new_event_email
        redirect_to admin_events_path
      elsif params[:admin_choice] == "Refuse event"
        @event.event_status_ids = [3]
        @event.save
        flash[:danger] = "Event refusé"
        redirect_to admin_events_path
      end
  end

  def destroy
  end

  def index
    @events = Event.all
    @status = EventStatus.all
  end


  def show
  end

  def edit
    @event = Event.find(params[:id])
  end

  private 
  def user_params
    params.require(:event).permit(:admin_choice)
  end

  def new_event_email
    EventMailer.new_event_email(self).deliver_now
  end
  
end
