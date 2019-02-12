class EventsController < ApplicationController
  
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
    @event = Event.create(title: param[:title], description: param[:description], price: param[:price],
      location: param[:location], duration: param[:duration], start_date: param[:start_date], admin: current_user)

    if @event.save
      flash[:notice] = "Post successfully created by #{current_user.first_name}"
      flash[:type] = "info"
      redirect_to root_path
    else
      render 'new'
    end

  end
  

end
