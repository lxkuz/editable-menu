ActiveAdmin.register Snippet do
  menu label: 'Текстовые блоки'
  permit_params :name, :text

  config.filters = false

  index do
    selectable_column
    column 'Название', :name
    actions
  end

  show do |snippet|
    attributes_table do
      row :name
      row :text do
        raw snippet.text
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name, label: 'Название'
      f.input :text, as: :ckeditor
    end

    f.actions
  end

end
