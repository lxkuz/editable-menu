ActiveAdmin.register ContentPage do
  permit_params :title,
                :description,
                :keywords,
                :name,
                :page_url,
                content_page_chapters_attributes: [
                  :id,
                  :position,
                  :name,
                  :anchor,
                  :content
                ]

  config.sort_order = 'created_at'
  config.filters = false

  index do
    selectable_column

    column :name

    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :page_url
      f.inputs do
        f.has_many :content_page_chapters, allow_destroy: true, heading: 'Chapters' do |cf|
          cf.input :position
          cf.input :name
          cf.input :anchor
          cf.input :content, as: :wysihtml5
        end
      end
      f.input :title
      f.input :description, as: :wysihtml5
      f.input :keywords, as: :wysihtml5
    end

    f.actions
  end
end
