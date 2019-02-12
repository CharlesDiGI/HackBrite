class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.references :event, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
