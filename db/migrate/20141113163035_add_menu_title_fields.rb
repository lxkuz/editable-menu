class AddMenuTitleFields < ActiveRecord::Migration
  def up
    add_column :articles,      :menu_title, :string, index: true
    add_column :content_pages, :menu_title, :string, index: true

    say_with_time 'Updating menu_title fields' do
      execute 'UPDATE content_pages SET menu_title = name'
      execute 'UPDATE articles SET menu_title = title'
    end
  end

  def down
    remove_column :articles,      :menu_title
    remove_column :content_pages, :menu_title
  end
end
