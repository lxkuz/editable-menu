class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :target_id
      t.string :target_type
      t.integer :parent_id
      t.string :menu
      t.string :name
      t.integer :position, default: 0
      t.timestamps
    end
  end
end
