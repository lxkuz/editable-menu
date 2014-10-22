class RemoveWysihtml5 < ActiveRecord::Migration
  def change
    drop_table :assets
  end
end
