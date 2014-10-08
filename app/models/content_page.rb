class ContentPage < ActiveRecord::Base
  extend FriendlyId
  friendly_id :page_url, use: [:slugged, :finders]

  has_many :content_page_chapters
  accepts_nested_attributes_for :content_page_chapters

  validates :page_url, presence: true, uniqueness: true

  def should_generate_new_friendly_id?
    page_url_changed?
  end
end
