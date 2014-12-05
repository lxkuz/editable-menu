class AddActiveStateOffice < ActiveRecord::Migration
  def change
    add_column :offices, :active, :boolean, default: true
  end
end
