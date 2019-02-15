module Admin::AdminHelper

  def is_admin?
    unless current_user.is_admin == true
      flash[:danger] = "You can't access it as you are not a webmaster"
      redirect_back(fallback_location: root_path)
    end
  end


end
