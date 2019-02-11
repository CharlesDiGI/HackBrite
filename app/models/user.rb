class User < ApplicationRecord
  after_create :welcome_send
  
  has_many :attendances
  has_many :events, class_name: 'Event', foreign_key: 'admin_id'
  has_many :events, class_name: 'Event', foreign_key: 'attendee_id'
  has_many :events, through: :attendances
  
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
