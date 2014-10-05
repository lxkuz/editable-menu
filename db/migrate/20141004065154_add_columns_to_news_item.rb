class AddColumnsToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :slug, :string
    add_column :news_items, :custom_url, :string
    add_index :news_items, :slug, unique: true
  end
end
