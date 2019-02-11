class Event < ApplicationRecord
  after_create :new_event_email

  has_many :attendances
  has_many :attendees, class_name: "User" #, foreign_key: :attendee_id
  has_many :attendees, through: :attendance

  belongs_to :admin, class_name: "User" #, foreign_key: :admin_id

  validates :start_date, presence: true #, unless: :past?
  validate :start_must_be_in_the_future
  
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { :greater_than => 0 }
  validates :location, presence: true

  validates :duration, presence: true
  validate :duration_5_min

  private
  def start_must_be_in_the_future
    errors.add(:start_date, "must be before end time") unless
        start_date.to_i > Time.now.to_i
  end 
      
  def duration_5_min
    errors.add(:duration, "must be a multiple of 5") unless
        duration % 5 == 0
  end

  def new_event_email
    EventMailer.new_event_email(self).deliver_now
  end

end
