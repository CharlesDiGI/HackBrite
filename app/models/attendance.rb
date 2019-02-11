class Attendance < ApplicationRecord
  after_create :new_attendee_email

  belongs_to :user
  belongs_to :event

  def new_attendee_email
    AttendanceMailer.new_attendee_email(self).deliver_now
  end

end
