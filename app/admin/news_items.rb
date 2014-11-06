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

  show do |news_item|
    attributes_table do
      row :title
      row :description
      row :keywords
      row :name
      row :body do
        raw news_item.body_formated
      end
      row :user_id
      row :custom_url
      row 'Страница на сайте' do
        link_to news_item.name, news_path(news_item)
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :custom_url
      f.input :body, as: :ckeditor
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

  member_action :update_in_place, method: :post do
    if request.xhr?
      news_item = NewsItem.find(params[:id])
      if news_item.update_attributes(permitted_params[:news_item])
        render :json => {:url => news_url(news_item), :notice => 'Новость успешно обновлена'}
      end
    end
  end

end
