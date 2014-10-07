class MenuItemsController < ApplicationController

  def destroy
    menu_item =  MenuItem.find params[:id]
    menu_item.destroy
    render text: true
  end

  def index
    menu = params[:menu]
    @menu_items = MenuItem.where menu: menu

    render json: @menu_items.to_json(:include => :children)
  end


end
