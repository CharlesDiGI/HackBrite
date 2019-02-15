module EventsHelper

  def end_date(event)
    (event.start_date + event.duration * 60).strftime("%-d/%m/%y: %H:%M")
  end

  def is_event_admin?
    unless current_user == Event.find(params[:id]).admin
      flash[:danger] = "You can't access it as you are not the administrator"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def event_admin
    current_user == Event.find(params[:id]).admin
  end

  def already_attending(event)
    event.attendees.include?(current_user)
  end

  def resize(event, size)
    if event.event_pic.attached?
    event.event_pic.variant(resize: size)
    end
  end

end
