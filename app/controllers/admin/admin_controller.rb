class Admin::AdminController < ApplicationController
  include Admin::AdminHelper
  before_action :authenticate_user!
  before_action :is_admin?

  def index
    @events = Event.all
    @status = EventStatus.all
  end
  
end
