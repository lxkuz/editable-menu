class ChangeTypeOfMetaTags < ActiveRecord::Migration
  def change
    change_column :articles, :description, :text
    change_column :articles, :keywords, :text

    change_column :content_pages, :description, :text
    change_column :content_pages, :keywords, :text
  end
end
