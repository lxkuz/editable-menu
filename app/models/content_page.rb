# == Schema Information
#
# Table name: content_pages
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  page_url    :string(255)
#  slug        :string(255)
#  title       :string(255)
#  description :text
#  keywords    :text
#  created_at  :datetime
#  updated_at  :datetime
#  content     :text
#

class ContentPage < ActiveRecord::Base
  extend FriendlyId
  friendly_id :page_url, use: [:slugged, :finders]

  has_many :content_page_chapters
  accepts_nested_attributes_for :content_page_chapters

  validates :content, presence: true
  validates :page_url, presence: true, uniqueness: true

  def should_generate_new_friendly_id?
    page_url_changed?
  end
end
