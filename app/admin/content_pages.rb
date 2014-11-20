ActiveAdmin.register ContentPage do
  permit_params :title,
                :menu_title,
                :description,
                :keywords,
                :page_url,
                :name,
                :subtitle,
                :content,
                chapters_attributes: [
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

  show do |page|
    attributes_table do
      row :title
      row :description
      row :keywords
      row :page_url
      row :name
      row :menu_title
      row :content
      row 'Страница на сайте' do
        link_to page.name, url_for(page)
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :menu_title
      f.input :page_url
      f.input :subtitle if f.object.page_is?('dealers')
      f.input :content, as: :ckeditor
      f.inputs do
        f.has_many :chapters, allow_destroy: true, heading: 'Текстовые блоки' do |cf|
          cf.input :name
          cf.input :position
          cf.input :content, as: :ckeditor
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
        render :json => {:url => content_page_url(content_page), :notice => 'страница успешно обновлена'}
      end
    end
  end

end
