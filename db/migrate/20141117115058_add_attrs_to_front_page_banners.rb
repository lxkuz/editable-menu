class AddAttrsToFrontPageBanners < ActiveRecord::Migration
  def change
    add_column :front_page_banners, :valign, :string
    add_column :front_page_banners, :font_size, :string
    add_column :front_page_banners, :font_color, :string
  end
end
