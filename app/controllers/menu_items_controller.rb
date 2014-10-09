class MenuItemsController < ApplicationController

  def search
    query = params[:query]
    objects = []
    [Article].each do |klass|
      objects += klass.search_by_like(query).limit(10)
    end
    res = objects.map do |obj|
      {value: obj.to_s, data: {target_id: obj.id, target_type: obj.class.name}}
    end
    render json: res
  end


  def destroy
    menu_item =  MenuItem.find params[:id]
    menu_item.destroy
    render text: true
  end


  def create
    MenuItem.create! params[:menu_item].permit(:menu, :parent_id, :target_id, :target_type)
    render text: true
  end

  def index
    menu = params[:menu]
    @menu_items = MenuItem.where menu: menu

    render json: @menu_items.to_json(:include => :children)
  end


end