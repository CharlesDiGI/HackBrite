class RemoveAdminFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :admin, index: true
    add_reference :events, :creator, index: true
  end
end
