class EventSubmission < ApplicationRecord

  belongs_to :event
  belongs_to :event_status

end
