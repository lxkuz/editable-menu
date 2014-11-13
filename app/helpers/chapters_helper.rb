module ChaptersHelper
  def chapter_parent_path(parent, ops)
    return article_path(parent, ops) if parent.is_a?(Article)
    return content_page_path(parent, ops) if parent.is_a?(ContentPage)
  end
end
