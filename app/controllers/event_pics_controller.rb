class EventPicsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event.event_pic.attach(params[:event_pic])
  end
  
end
