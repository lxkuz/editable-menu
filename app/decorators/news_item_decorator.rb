class NewsItemDecorator < Draper::Decorator
  delegate_all

  def updated_short_date
    l(Date.parse(object.updated_at.to_s), format: :day_month)
  end
end
