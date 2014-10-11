class AddRecipientsToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :user_request_recipients, :text
  end
end
