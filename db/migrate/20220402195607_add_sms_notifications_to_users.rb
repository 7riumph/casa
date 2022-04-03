class AddSmsNotificationsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sms_notifications, :boolean, default: false
  end
end
