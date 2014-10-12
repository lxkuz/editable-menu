class CreateContentPages < ActiveRecord::Migration
  def change
    create_table :content_pages do |t|
      t.string :name
      t.string :page_url, unique: true
      t.string :slug, unique: true
      t.string :title
      t.string :description
      t.string :keywords
      t.timestamps
    end
  end
end
