class AddFieldsToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :manager, :string
    add_column :offices, :description, :text
    add_column :offices, :directions, :text
    add_column :offices, :work_hours, :text
    add_column :offices, :phone_numbers, :text
    add_column :offices, :email, :string
    add_column :offices, :fb_url, :string
    add_column :offices, :vk_url, :string
    add_column :offices, :tw_url, :string
    add_column :offices, :insta_url, :string
    add_column :offices, :rating, :float
    add_column :offices, :total_votes, :integer
  end
end
