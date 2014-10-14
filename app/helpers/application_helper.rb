module ApplicationHelper
  def editable_in_place_data attr, type=nil, nested_for=nil, nested_id=nil, nested_index=nil
    if current_user.try(:admin?)
      {
          class: :ckeditable,
          id: 'ck_' + (nested_for.nil? ? '' : (nested_for.to_s.underscore+'_')) + attr.to_s.underscore,
          contenteditable: "true",
          data: {
            name: attr,
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

  def cksubmit(obj)
    if current_user.try(:admin?)
      content_tag :div, id: :'ck-actions' do
        button_tag(:Сохранить, id: 'ck-submit', data:{ url: url_for([:update_in_place, :admin, obj]), name: obj_name(obj)}) +
        button_tag(:Отменить, id: 'ck-cancel')
      end
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
end
