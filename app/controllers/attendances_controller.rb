class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index, :new]
  before_action :already_attending, only: [:new, :create]
  before_action :admin_cannot_attend_own_event, only: [:new, :create]

  def new
    puts params[:id]
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    # Amount in cents
    @amount = @event.price * 100
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer for event attendance',
      :currency    => 'eur'
    )

    Attendance.create(attendee: current_user, event: Event.find(params[:event_id]), stripe_customer_id: customer.id)
    redirect_to event_path(params[:event_id])
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_event_charge_path
    
  end

  def index
    @event = Event.find(params[:event_id])
    @attendees = @event.attendees
  end

end
