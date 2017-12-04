class RemoveFromNotification < ActiveRecord::Migration[5.1]
  def change
    remove_column :notifications, :notifiable_id, :integer
    remove_column :notifications, :notifiable_type, :string
  end
end
