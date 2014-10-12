class RemoveMetatagsFromNewsItems < ActiveRecord::Migration
  def change
    remove_column :news_items, :site
    remove_column :news_items, :noindex
    remove_column :news_items, :noindex_bot
    remove_column :news_items, :nofollow
    remove_column :news_items, :nofollow_bot
    remove_column :news_items, :canonical_url
    remove_column :news_items, :author_link
    remove_column :news_items, :publisher_link
  end
end
