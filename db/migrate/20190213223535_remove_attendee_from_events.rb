class RemoveAttendeeFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :attendee, index_key: true
  end
end
