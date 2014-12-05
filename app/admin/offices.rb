ActiveAdmin.register Office do
  menu priority: 20, label: "Офисы"
  permit_params :name,
                :postindex,
                :city,
                :phone,
                :street_address,
                :user_request_recipients

  form do |f|
    f.inputs 'Контактная информация' do
      f.input :name
      f.input :postindex
      f.input :city
      f.input :phone
      f.input :street_address
    end

    f.inputs 'Настройки форм' do
      f.input :user_request_recipients, label: 'Получатели заявок (email через запятую)', input_html: { rows: 1 }
    end

    f.actions
  end
end
