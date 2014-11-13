class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.text :text

      t.timestamps
    end

    add_index :snippets, :name, unique: true
  end
end
