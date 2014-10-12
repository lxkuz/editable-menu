# == Schema Information
#
# Table name: offices
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  postindex               :integer
#  city                    :string(255)
#  street_address          :string(255)
#  latitude                :float
#  longitude               :float
#  created_at              :datetime
#  updated_at              :datetime
#  user_request_recipients :text
#

class Office < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? }
  after_validation :set_user_request_recipients, on: [ :create, :update ]

  def address
    [postindex, city, street_address].compact.join(', ')
  end

  private

  def set_user_request_recipients
    self.user_request_recipients = 'manager@moscowstairs.ru' if user_request_recipients.blank?
  end
end
