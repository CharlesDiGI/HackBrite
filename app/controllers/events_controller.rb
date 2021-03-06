class EventsController < ApplicationController
  include EventsHelper
  before_action :authenticate_user!, only: [:new]
  before_action :is_event_creator?, only: [:destroy, :update, :edit]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])

  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
          event_submission(@event)
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user == @event.creator
      @event.destroy
      flash[:notice] = "Post successfully deleted"
      flash[:type] = "danger"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "You're not the creator of this event"
      flash[:type] = "danger"
      redirect_to event_path(@event)
    end
  end

  private 
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :creator, :event_pic)
    end

end