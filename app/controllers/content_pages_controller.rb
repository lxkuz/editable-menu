class ContentPagesController < ResourcesController
  actions :show
  load_and_authorize_resource

  def show
    @chapters = @content_page.chapters
    fill_meta_info @content_page
  end
end
