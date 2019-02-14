class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send
  
  has_one_attached :avatar
  # has_many :attendances
  has_many :organized_events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attended_events, foreign_key: 'attendee_id', class_name: "Attendance"
    has_many :events, through: :attendances
  # has_many :events, class_name: 'Event', foreign_key: 'admin_id'
  # has_many :events, class_name: 'Event', foreign_key: 'attendee_id'
  
  # validates :first_name, presence: { message: "Please type your first name" }
  # validates :last_name, presence: { message: "Please type your last name" }
  validates :email, presence: { message: "Please insert your email adress" }, 
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email 'foo@foobar.bar' " }


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
