class AddTextContentToContentPage < ActiveRecord::Migration
  def change
    add_column :content_pages, :content, :text
  end
end
