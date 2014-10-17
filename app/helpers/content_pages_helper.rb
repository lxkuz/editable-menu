module ContentPagesHelper
  def content_pages_admin_attrs(item)
    {
       page_url: editable_in_place_data(item, :page_url),
       title: editable_in_place_data(item, :title),
       description: editable_in_place_data(item, :description),
       keywords: editable_in_place_data(item, :keywords),
    }
  end

  def content_page_chapters_admin_attrs(item, id, index)
    {
        position: editable_in_place_data(item, :position, nil, :chapters_attributes, id, index),
    }
  end
end
