module NewsItemsHelper
  def news_admin_attrs(item)
    {
       custom_url: editable_in_place_data(item, :custom_url),
       title: editable_in_place_data(item, :title),
       description: editable_in_place_data(item, :description),
       keywords: editable_in_place_data(item, :keywords),
    }
  end
end
