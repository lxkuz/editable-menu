class AddArticleIdToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :article_id, :integer

    add_index :chapters, :article_id
    add_index :chapters, :content_page_id
  end
end
