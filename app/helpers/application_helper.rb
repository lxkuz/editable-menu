module ApplicationHelper
  def editable_in_place_data attr, type=nil
    if current_user.try(:admin?)
      {
          class: :ckeditable,
          id: 'ck_' + attr.to_s,
          contenteditable: "true",
          data: {
            name: attr,
            type: type
          }
      }
    else
      {}
    end
  end

  def cksubmit(obj)
    if current_user.try(:admin?)
      content_tag :div, id: :'ck-actions' do
        button_tag(:Сохранить, id: 'ck-submit', data:{ url: url_for([:update_in_place, :admin, obj]), name: obj.class.to_s.downcase}) + button_tag(:Отменить, id: 'ck-cancel')
      end
    end
  end
end
