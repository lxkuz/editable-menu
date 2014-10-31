class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :office_id
      t.text :body
      t.string :author
      t.string :avatar

      t.timestamps
    end
  end
end
