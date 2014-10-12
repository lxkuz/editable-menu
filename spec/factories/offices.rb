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

FactoryGirl.define do
  factory :office do
    trait :in_moscow do
      name 'на Пятницкой'
      city 'Москва'
      street_address 'Пятницкая улица, 39, офис 205'
    end

    trait :in_ufa do
      name 'на Руставели'
      city 'Уфа'
      street_address 'улица Шота Руставели, 25, офис 101'
    end
  end
end
