class Event < ApplicationRecord

  has_many :attendances

  has_many :attendants, class_name: "User" #, foreign_key: :attendant_id
  has_many :attendants, through: :attendance

  belongs_to :admin, class_name: "User" #, foreign_key: :user_id
end
