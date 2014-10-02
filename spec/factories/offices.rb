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
