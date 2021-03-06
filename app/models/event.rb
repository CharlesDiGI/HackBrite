class Event < ApplicationRecord
  # after_create :new_event_email
  has_one_attached :event_pic
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances 
  belongs_to :creator, class_name: "User" #, foreign_key: :admin_id

  has_many :event_submissions
  has_many :event_statuses, through: :event_submissions

  validates :start_date, 
              presence: { message: "Put a start date please" }
  validate :start_must_be_in_the_future
  
  validates :duration,
              presence: { message: "Put a duration please" },
              numericality: { only_integer: true, greater_than: 0 }
  
  validate :duration_5_min

  validates :title,
              presence: true, 
              length: { minimum: 5, maximum: 140, too_short: "Title too short, at least 5 characters !", too_long: "Too long, max 140 characters !" }
  
  validates :description,
              presence: { message: "Put a description please" },
              length: { minimum: 20, maximum: 1000, too_short: "Description too short, at least 20 characters !", too_long: "Too long, max 1000 characters !" }

  validates :price,
              presence: { message: "Put a price please" },
              numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000, message: "Price should be an integer between 1 & 1000" }

  validates :location,
               presence: { message: "Put a location please" }


  private

  def start_must_be_in_the_future
    errors.add(:start_date, "must be before end time") unless
    start_date.to_i > Time.now.to_i
  end 
  
  def duration_5_min
    unless duration.nil?
    errors.add(:duration, "must be a multiple of 5") unless
        duration % 5 == 0
    end
  end

  def new_event_email
    EventMailer.new_event_email(self).deliver_now
  end

end
