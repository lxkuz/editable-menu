class MenuItemsController < ApplicationController

  def search
    query = params[:query]
    objects = []


    [Article, ContentPage].each do |klass|
      # мы отключили уникальность ссылок к материалам
      # join_query = "left outer join menu_items on menu_items.target_id = #{klass.name.underscore.pluralize}.id and menu_items.target_type = '#{klass}'"
      # objects += klass.search_by_like(query).joins(join_query).where("menu_items.target_id is null").limit(10)
      objects += klass.active.search_by_like(query).limit(10)
    end
    res = objects.map do |obj|
      {value: obj.to_s, data: {target_id: obj.id, target_type: obj.class.name}}
    end
    render json: res
  end


  def destroy
    menu_item = MenuItem.find params[:id]
    menu_item.destroy
    render json: { text: true, notice: 'Пункт меню удален' }
  end

  def update
    menu_item =  MenuItem.find params[:id]
    menu_item.update_attributes build_params
    render json: { text: true, notice: 'Пункт меню изменен' }
  end

  def create
    MenuItem.create! build_params
    render json: { text: true, notice: 'Пункт меню создан' }
  end

  def index
    menu = params[:menu]
    @menu_items = MenuItem.where(menu: menu).reject{|item| item.target.present? && item.target.active == false }
    render json: @menu_items.to_json(:include => :children)
  end

  private

  def build_params
    params[:menu_item].permit(:menu, :position, :name, :url, :parent_id, :target_id, :target_type)
  end


end