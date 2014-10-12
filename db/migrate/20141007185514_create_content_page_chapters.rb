class CreateContentPageChapters < ActiveRecord::Migration
  def change
    create_table :content_page_chapters do |t|
      t.string     :name
      t.string     :anchor
      t.text       :content
      t.belongs_to :content_page
      t.integer    :position
      t.timestamps
    end
  end
end
