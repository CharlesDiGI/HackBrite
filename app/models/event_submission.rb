class EventSubmission < ApplicationRecord

  belongs_to :event
  belongs_to :event_status
  belongs_to :webmaster, class_name: "User", optional: true

end
