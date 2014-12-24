class CreateOfficeSlides < ActiveRecord::Migration
  def change
    create_table :office_slides do |t|
      t.string :image
      t.integer :office_id
      t.timestamps
    end
  end
end
