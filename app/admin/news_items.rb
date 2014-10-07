ActiveAdmin.register NewsItem do
  permit_params :title,
                :description,
                :keywords,
                :name,
                :body,
                :user_id,
                :custom_url

  config.sort_order = 'updated_at'

  index do
    selectable_column

    column :name
    column :body do |news_item|
      news_item.body.truncate 200
    end
    column :updated_at

    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :body, as: :wysihtml5
      f.input :user
      f.input :title
      f.input :description, as: :wysihtml5
      f.input :keywords, as: :wysihtml5
      f.input :custom_url
    end

    f.actions
  end
end
