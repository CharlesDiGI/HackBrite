class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :is_admin?, only: [:destroy, :update, :edit]
  
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
    puts "*" * 40
    puts params
    puts "*" * 40
    @event = Event.new(event_params)
    @event.admin = current_user
    puts "*" * 40
    puts params[:event_pic].inspect
    puts "*" * 40
    # @event.event_pic.attach(params[:event_pic])
    
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
    if current_user == @event.admin
      @event.destroy
      flash[:notice] = "Post successfully deleted"
      flash[:type] = "danger"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "You're not the admin of this event"
      flash[:type] = "danger"
      redirect_to event_path(@event)
    end
    # respond_to do |format|
    #   format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end
    # @event = Event.find(params[:id])
    # post_params = params[:event]

    # if @event.update(start_date: post_params[:start_date], title: post_params[:title], description: post_params[:description], price: [:location, duration: post_params[:duration]])
  	# 	redirect_to user_path(params[:id])
  	# else
  	#   flash[:danger] = "Il manque des informations"
  	#   render :new 
  	# end



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
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin, :event_pic)
    end

    def is_user_new_for_event?
      if current_user != @event.admin || current_user != @event.attendees.find(current_user.id)
        return true
      else
      end
    end

end