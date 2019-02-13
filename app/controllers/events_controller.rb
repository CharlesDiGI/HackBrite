class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    # @user = current_user
    @user_new_for_event?
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    puts event_params
    @event.admin = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

    # @event = Event.create(title: param[:title], description: param[:description], price: param[:price],
    #   location: param[:location], duration: param[:duration], start_date: param[:start_date], admin: current_user)
    #   puts @event

    # if @event.save
    #   flash[:notice] = "Post successfully created by #{current_user.first_name}"
    #   flash[:type] = "info"
    #   redirect_to root_path
    # else
    #   render 'new', danger: "#{@event.errors.full_messages.join(". ")}"
    # end

  private 
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin)
    end

    def is_user_new_for_event?
      if current_user != @event.admin && current_user != @event.attendees.find(current_user)
        true
      end
    end

end