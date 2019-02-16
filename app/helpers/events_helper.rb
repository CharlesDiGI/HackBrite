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

  def event_submission(event)
    @event_submission = EventSubmission.create!(event_id: event.id, event_status_id: "1")
  end

  def accepted(event)
    event.event_status_ids == [2]
  end
  
  def pending(event)
    event.event_status_ids == [1]
  end
  
  def refused(event)
    event.event_status_ids == [3]
  end

  def status(event)
    case event.event_status_ids
    when [1]
    return "Pending"
    when [2]
    return "Accepted"
    when [3]
    return "Refused"
    else
    return "No status"
    end
  end

  def creator(event)
    "#{event.user.last_name}"
  end


end
