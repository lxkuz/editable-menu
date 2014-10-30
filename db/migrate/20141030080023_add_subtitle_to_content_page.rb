class AddSubtitleToContentPage < ActiveRecord::Migration
  def change
    add_column :content_pages, :subtitle, :string
  end
end
