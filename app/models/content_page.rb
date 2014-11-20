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

  include SearchByLike
  has_search_by_like_for :name, :menu_title

  include HasMenuItems

  has_many :chapters, dependent: :destroy
  accepts_nested_attributes_for :chapters, allow_destroy: true

  validates :content, presence: true
  validates :page_url, presence: true, uniqueness: true

  def should_generate_new_friendly_id?
    page_url_changed?
  end

  def translit_field
    page_url
  end

  def to_s
    menu_title.present? ? menu_title : name
  end

  def page_is?(kind)
    !new_record? && slug == kind
  end

end
