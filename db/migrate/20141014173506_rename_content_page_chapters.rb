class RenameContentPageChapters < ActiveRecord::Migration
  def change
    rename_table :content_page_chapters, :chapters
  end
end
