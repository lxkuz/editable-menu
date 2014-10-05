ActiveAdmin.register Article do
  permit_params :title,
                :title_translit,
                :description,
                :keywords,
                :content,
                :position,
                :published_at

  config.sort_order = 'position_asc'

  index do
    selectable_column

    column 'Заголовок', :title
    column 'URL', :title_translit
    column :description do |article|
      article.description.truncate 32
    end
    column :keywords
    column 'Текст', :content, class: 'col-content' do |article|
      article.content.truncate 140
    end
    column 'Позиция', :position
    column 'Опубликовано', :published_at

    actions
  end

  filter :title
  filter :keywords

  form do |f|
    f.inputs do
      f.input :title, label: 'Заголовок'
      f.input :title_translit, label: 'URL'
      f.input :description, label: 'Описание (не больше 255 символов)'
      f.input :keywords, label: 'Ключевые слова (не больше 25 слов)'

      # TODO: Limit html attributes later
      f.input :content, as: :wysihtml5 # , commands: [ :link ], blocks: [ :h3, :p]
      f.input :position, label: 'Позиция в списке статей'
      f.input :published_at, label: 'Опубликовано', as: :string
    end

    f.actions
  end

end
