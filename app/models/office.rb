# == Schema Information
#
# Table name: offices
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  postindex      :integer
#  city           :string(255)
#  street_address :string(255)
#  latitude       :float
#  longitude      :float
#  created_at     :datetime
#  updated_at     :datetime
#

class Office < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? }

  def address
    [postindex, city, street_address].compact.join(', ')
  end
end
