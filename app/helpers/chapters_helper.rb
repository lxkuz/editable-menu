module ChaptersHelper
  def chapter_parent_path(parent, ops)
    article_path(parent, ops) if parent.is_a?(Article)
    content_page_path(parent, ops) if parent.is_a?(ContentPage)
  end
end
