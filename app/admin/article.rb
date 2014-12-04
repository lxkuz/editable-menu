ActiveAdmin.register Article do
  menu :label => "Статьи"
  permit_params :id,
                :title,
                :title_translit,
                :menu_title,
                :description,
                :keywords,
                :content,
                :position,
                :published_at,
                chapters_attributes: [
                  :id,
                  :position,
                  :name,
                  :anchor,
                  :content,
                  :_destroy
                ]

  config.sort_order = 'position_asc'
  config.filters = false

  action_item only: :show do
    link_to('Смотреть на сайте', url_for(resource))
  end

  index do
    selectable_column

    column 'Заголовок', :title
    column 'URL', :title_translit
    column :description do |article|
      article.description
    end
    column :keywords
    column 'Текст', :content, class: 'col-content' do |article|
      article.content
    end
    column 'Позиция', :position
    column 'Опубликовано', :published_at

    actions
  end

  show do |article|
    attributes_table do
      row :title
      row :title_translit
      row :menu_title
      row :description
      row :keywords
      row :content
      row :position
      row :published_at
      row 'Статья на сайте' do
        link_to article.title, url_for(article)
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title, label: 'Заголовок'
      f.input :title_translit, label: 'URL'
      f.input :menu_title, label: 'Заголовок для меню'
      # TODO: Limit html attributes later
      f.input :content, as: :ckeditor # , commands: [ :link ], blocks: [ :h3, :p]

      f.inputs do
        f.has_many :chapters, allow_destroy: true, heading: false do |ch|
          ch.input :name
          ch.input :position
          ch.input :content, as: :ckeditor
        end
      end

      f.input :published_at, label: 'Опубликовано', as: :string

      f.input :description, label: 'Описание (не больше 255 символов)', input_html: { rows: 2 }
      f.input :keywords, label: 'Ключевые слова (не больше 25 слов)', input_html: { rows: 2 }
    end

    f.actions
  end

  member_action :update_in_place, method: :post do
    if request.xhr?
      article = Article.find(params[:id])
      if article.update_attributes(permitted_params[:article])
        render :json => {:url => article_url(article), :notice => 'Статья успешно обновлена'}
      end
    end
  end

end
