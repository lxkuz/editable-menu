class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name
      t.integer :postindex
      t.string :city
      t.string :street_address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
