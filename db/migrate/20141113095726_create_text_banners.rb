class CreateTextBanners < ActiveRecord::Migration
  def change
    create_table :text_banners do |t|
      t.string :image
      t.string :name
      t.string :v_align
      t.string :bg
      t.text :body
      t.string :url
      t.boolean :all_block_url

      t.timestamps
    end
  end
end
