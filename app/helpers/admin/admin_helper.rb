module Admin::AdminHelper

  def is_admin?
    unless current_user.is_admin?
      flash[:danger] = "You can't access it as you are not a webmaster"
      redirect_back(fallback_location: root_path)
    end
  end

  def admin_access?
    if current_user && current_user.is_admin?
      return true
    else
      return false
    end
  end

end
