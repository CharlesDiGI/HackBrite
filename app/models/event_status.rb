class EventStatus < ApplicationRecord
  
  has_many :event_submissions
  has_many :events, through: :event_submissions

end
