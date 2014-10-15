class AddTranslitFieldToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :translit, :string
  end
end
