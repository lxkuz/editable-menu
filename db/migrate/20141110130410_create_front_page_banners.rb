class CreateFrontPageBanners < ActiveRecord::Migration
  def change
    create_table :front_page_banners do |t|
      t.string :image
      t.string :title
      t.string :name
      t.string :url
      t.integer :price
      t.timestamps
    end
  end
end
