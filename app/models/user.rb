class User < ApplicationRecord

has_many :events, class_name: 'Event', foreign_key: 'admin_id'
has_many :events, class_name: 'Event', foreign_key: 'attendee_id'
has_many :events, through: :attendance



end
