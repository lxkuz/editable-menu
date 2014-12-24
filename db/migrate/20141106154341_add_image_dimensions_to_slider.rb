class AddImageDimensionsToSlider < ActiveRecord::Migration
  def change
    add_column :office_slides, :width, :integer
  end
end
