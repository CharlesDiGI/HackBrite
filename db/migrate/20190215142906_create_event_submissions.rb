class CreateEventSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :event_submissions do |t|
      t.references :event, index: true
      t.references :event_status, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
