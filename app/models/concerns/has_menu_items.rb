module HasMenuItems
  extend ActiveSupport::Concern

  included do

    after_save :update_menu_items


    private

    def update_menu_items
      items = MenuItem.where target: self
      items.each do |item|
        item.name = self.to_s
        item.save
      end
    end
  end
end