class MenuItem < ActiveRecord::Base
  include HasPosition
  has_position scoped_fields: [:menu, :parent_id]

  validates :target, presence: true
  validates :menu, presence: true, unless: :parent_id


  belongs_to :target, polymorphic: true
  belongs_to :parent, class_name: "MenuItem"
  has_many :children, class_name: "MenuItem", foreign_key: :parent_id, dependent: :destroy

  before_save :fill_name

  private

  def fill_name
    self.name = target.to_s if self.name.blank?
  end

end