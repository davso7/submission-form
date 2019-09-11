class AddDeadlineAndSentFlagsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deadline, :date, default: nil
    add_column :users, :invitation_sent, :boolean, default: false
  end
end
