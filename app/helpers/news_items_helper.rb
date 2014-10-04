module NewsItemsHelper
  def news_item_short_date(date)
    l(Date.parse(date.to_s), format: :day_month)
  end
end
