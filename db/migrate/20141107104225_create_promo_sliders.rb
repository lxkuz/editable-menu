class CreatePromoSliders < ActiveRecord::Migration
  def change
    create_table :promo_slides do |t|
      t.string :title, :null => false
      t.string :text
      t.string :url
      t.boolean :title_italic
      t.boolean :text_italic

      t.timestamps
    end
  end
end
