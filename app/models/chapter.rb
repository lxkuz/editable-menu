# == Schema Information
#
# Table name: chapters
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  anchor          :string(255)
#  content         :text
#  content_page_id :integer
#  position        :integer
#  created_at      :datetime
#  updated_at      :datetime
#  article_id      :integer
#

class Chapter < ActiveRecord::Base
  belongs_to :content_page
  belongs_to :article

  validates :anchor, :name, :content, presence: true

  before_validation :set_anchor

  default_scope { order(:position) }

  private

  def set_anchor
    self.anchor = Russian::translit(name.split.join('-')) if name.present?
  end
end
