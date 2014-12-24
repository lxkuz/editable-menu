class AddActiveState < ActiveRecord::Migration
  def change
    # add_column :offices, :active, :boolean, default: true
    add_column :news_items, :active, :boolean, default: true
    add_column :content_pages, :active, :boolean, default: true
    add_column :articles, :active, :boolean, default: true
  end
end
