class RemoveItalicTextPromoslider < ActiveRecord::Migration
  def change
    remove_column :promo_slides, :text_italic
  end
end
