class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      #metatags>>>
      t.string  :title
      t.string  :site
      t.text    :description
      t.text    :keywords
      t.boolean :noindex, default: false
      t.string  :noindex_bot
      t.boolean :nofollow, default: false
      t.string  :nofollow_bot
      t.string  :canonical_url
      t.string  :author_link
      t.string  :publisher_link
      #metatags<<<

      t.string     :name
      t.text       :body
      t.belongs_to :user

      t.timestamps
    end
  end
end
