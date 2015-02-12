ActiveAdmin.register DealerRequest do
  menu label: 'Заявки дилеров'
  permit_params :name, :email, :phone, :file_attachment, :city, :description

end
