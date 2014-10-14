ActiveAdmin.register Article do
  menu :label => "Статьи"
  permit_params :title,
                :title_translit,
                :description,
                :keywords,
                :content,
                :position,
                :published_at

  config.sort_order = 'position_asc'
  config.filters = false

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

  form do |f|
    f.inputs do
      f.input :title, label: 'Заголовок'
      f.input :title_translit, label: 'URL'
      # TODO: Limit html attributes later
      f.input :content, as: :wysihtml5 # , commands: [ :link ], blocks: [ :h3, :p]
      f.input :position, label: 'Позиция в списке статей'
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
        render :json => {:url => article_url(article)}
      end
    end
  end

end
