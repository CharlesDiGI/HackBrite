class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    puts params[:user]
    puts "*" * 50
    post_params = params[:user]
    
    # post_params = params.require(:user).permit(:first_name, :last_name, :description)

    if @user.update(params.require(:user)) #@user.update(first_name: post_params[:first_name], last_name: post_params[:last_name], description: post_params[:description])
      # if @user.update(post_params)
  		redirect_to user_path(params[:id])
  	else
  	  flash[:danger] = "Il manque des informations"
  	  render :new 
  	end

  end

  def destroy
  end
end
