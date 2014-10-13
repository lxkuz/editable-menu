ActiveAdmin.register UserRequest do
  menu label: 'Заявки'

  action_item do
    link_to 'Изменить список получателей', edit_admin_office_path(session[:office_id])
  end

  index do
    selectable_column

    column :id
    column :email
    column 'Телефон', :phone
    column :attachment do |user_request|
      if user_request.file_attachment.present?
        link_to user_request.file_attachment.url, user_request.file_attachment.url
      else
        nil
      end
    end
    column :created_at

    actions
  end

  config.filters = false
end
