class Admin::UsersController < ApplicationController
  include Admin::AdminHelper
  before_action :authenticate_user!
  before_action :is_admin?
  
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
