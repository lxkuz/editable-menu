class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :title_translit
      t.string :description
      t.string :keywords
      t.text :content
      t.integer :position
      t.datetime :published_at

      t.timestamps
    end
  end
end
