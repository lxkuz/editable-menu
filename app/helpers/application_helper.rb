module ApplicationHelper
  def display_meta_tags_with_defaults
    display_meta_tags(:site => 'МЛ', :reverse => true)
  end

  def editable_in_place_data object, attribute, type=nil, nested_for=nil, nested_id=nil, nested_index=nil
    if current_user.try(:admin?)
      {
          class: :ckeditable,
          id: obj_id(attribute, nested_for, nested_id),
          contenteditable: "true",
          data: {
            object: obj_name(object),
            url: url_for([:update_in_place, :admin, object]),
            attribute: attribute,
            type: type,
            nested_for: nested_for,
            nested_id: nested_id,
            nested_index: nested_index
          }
      }
    else
      {}
    end
  end

  def obj_name(obj)
    #obj can be decorator
    if obj.class.superclass == Draper::Decorator
      obj.object.class.to_s.underscore
    else
      obj.class.to_s.underscore
    end
  end

  def obj_id attribute, nested_for, nested_id
    ['ck', nested_for.to_s.underscore, nested_id.to_s, attribute.to_s.underscore].compact.join('_')
  end


  def menu_section name, options = {}
    klass = options[:class]
    content_tag :div, "",
                class: klass, "menu-editor-role" => true,
                data: {menu: name, search_url: search_menu_items_path,
                       ul_class: options[:ul_class], li_class: options[:li_class],
                       editable: current_user.try(:admin?)}

  end

  def menu_editor_btn
    content_tag :div, "", class: "fa fa-pencil me-btn edit", "edit-tumbler-role" => true
  end

end
