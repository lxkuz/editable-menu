ActiveAdmin.register NewsItem do
  permit_params :title,
                :description,
                :keywords,
                :name,
                :body,
                :user_id,
                :custom_url

  config.sort_order = 'updated_at'
  config.filters = false

  index do
    selectable_column

    column :name
    column :body do |news_item|
      news_item.body.truncate 200
    end
    column :updated_at

    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :custom_url
      f.input :body, as: :wysihtml5
      f.input :title
      f.input :description, input_html: { rows: 2 }
      f.input :keywords, input_html: { rows: 2 }
    end

    f.actions
  end

  controller do
    def create
      @news_item = NewsItem.new(permitted_params[:news_item])
      @news_item.user = current_user
      super
    end
  end

end
