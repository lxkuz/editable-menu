ActiveAdmin.register Office do
  menu false
  permit_params :name,
                :postindex,
                :city,
                :street_address,
                :user_request_recipients

  form do |f|
    f.inputs 'Контактная информация' do
      f.input :name
      f.input :postindex
      f.input :city
      f.input :street_address
    end

    f.inputs 'Настройки форм' do
      f.input :user_request_recipients, label: 'Получатели заявок (email через запятую)', input_html: { rows: 1 }
    end

    f.actions
  end
end
