class ContentPagesController < ResourcesController
  actions :show
  load_and_authorize_resource

  def show
    set_meta_tags title:       @content_page.title,
                  description: @content_page.description,
                  keywords:    @content_page.keywords

  end
end