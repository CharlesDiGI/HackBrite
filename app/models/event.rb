class Event < ApplicationRecord

  has_many :attendances

  has_many :attendees, class_name: "User" #, foreign_key: :attendee_id
  has_many :attendees, through: :attendance

  belongs_to :admin, class_name: "User" #, foreign_key: :admin_id
end
