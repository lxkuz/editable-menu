ActiveAdmin.register ContentPage do
  permit_params :title,
                :description,
                :keywords,
                :page_url,
                :name,
                :content,
                content_page_chapters_attributes: [
                  :id,
                  :position,
                  :name,
                  :anchor,
                  :content,
                  :_destroy
                ]

  config.sort_order = 'created_at'
  config.filters = false

  index do
    selectable_column

    column :name
    column :page_url
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :page_url
      f.input :content, as: :wysihtml5
      f.inputs do
        f.has_many :content_page_chapters, allow_destroy: true, heading: 'Текстовые блоки' do |cf|
          cf.input :position
          cf.input :name
          cf.input :anchor
          cf.input :content, as: :wysihtml5
        end
      end
      f.input :title
      f.input :description, input_html: { rows: 2 }
      f.input :keywords,    input_html: { rows: 2 }
    end

    f.actions
  end

  member_action :update_in_place, method: :post do
    if request.xhr?
      content_page = ContentPage.find_by_slug(params[:id])
      if content_page.update_attributes(permitted_params[:content_page])
        render :json => {:url => content_page_url(content_page)}
      end
    end
  end

end
