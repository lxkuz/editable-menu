module ArticlesHelper
  def articles_admin_attrs(item)
    {
        title_translit: editable_in_place_data(item, :title_translit),
        description: editable_in_place_data(item, :description),
        keywords: editable_in_place_data(item, :keywords),
        position: editable_in_place_data(item, :position)
    }
  end

  def article_chapters_admin_attrs(item, id, index)
    {
        position: editable_in_place_data(item, :position, nil, :chapters_attributes, id, index),
    }
  end

end
