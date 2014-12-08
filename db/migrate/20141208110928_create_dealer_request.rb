class CreateDealerRequest < ActiveRecord::Migration
  def change
    create_table :dealer_requests do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :city
      t.string :file_attachment
      t.text :description
      t.timestamps
    end
  end
end
