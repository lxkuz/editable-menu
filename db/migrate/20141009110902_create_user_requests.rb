class CreateUserRequests < ActiveRecord::Migration
  def change
    create_table :user_requests do |t|
      t.string :email
      t.string :phone
      t.string :file_attachment

      t.timestamps
    end
  end
end
