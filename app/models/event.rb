class Event < ApplicationRecord
  after_create :new_event_email

  has_many :attendances

  has_many :attendees, class_name: "User" #, foreign_key: :attendee_id
  has_many :attendees, through: :attendance

  belongs_to :admin, class_name: "User" #, foreign_key: :admin_id

  def new_event_email
    EventMailer.new_event_email(self).deliver_now
  end

end
