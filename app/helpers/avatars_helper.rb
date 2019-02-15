module AvatarsHelper

  def resize_avatar(user, size)
    if user.avatar.attached?
    user.avatar.variant(resize: size)
    end
  end

end
