ActiveAdmin.register Office do
  menu priority: 20, label: "Офисы"
  permit_params :name,
                :postindex,
                :city,
                :phone,
                :active,
                :street_address,
                :user_request_recipients

  batch_action 'Активировать' do |selection|
    Office.find(selection).each do |office|
      office.activate!
    end
    redirect_to collection_path
  end

  batch_action 'Дективировать' do |selection|
    Office.find(selection).each do |office|
      office.deactivate!
    end
    redirect_to collection_path
  end

  form do |f|
    f.inputs 'Контактная информация' do
      f.input :name
      f.input :postindex
      f.input :active, label: 'Активировано'
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
