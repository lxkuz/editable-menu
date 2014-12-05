class AddPhoneToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :phone, :string
  end
end
