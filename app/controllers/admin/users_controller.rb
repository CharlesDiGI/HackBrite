class Admin::UsersController < ApplicationController
  include Admin::AdminHelper
  before_action :authenticate_user!
  before_action :is_admin?
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to admin_users_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    post_params = params[:user]
    if @user.update(first_name: post_params[:first_name], last_name: post_params[:last_name], description: post_params[:description])
      flash[:warning] = "Info user updatées"
      redirect_to admin_users_path
  	else
  	  flash[:danger] = "Il manque des informations"
  	  render :new 
  	end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User succesfully deleted"
    redirect_to admin_users_path
  end

  private 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :password)
  end

end
