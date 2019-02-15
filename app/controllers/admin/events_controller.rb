class Admin::EventsController < ApplicationController

  def update
    @event = Event.find(params[:id])
      if params[:admin_choice] == "Validate event"
        puts @event.event_status_ids
        @event.event_status_ids = [2]
        puts "*" * 50
        puts @event.event_status_ids
        @event.save
        flash[:warning] = "Event accepté"
        redirect_to admin_events_path
      else
        flash[:danger] = "Il manque des informations"
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

end
