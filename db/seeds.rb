Office.create!(
  name: 'на Пятницкой',
  city: 'Москва',
  postindex: 119017,
  street_address: 'Пятницкая улица, 39, офис 205'
)

Office.create!(
  name: 'на Невском',
  city: 'Санкт-Петербург',
  postindex: 191025,
  street_address: 'Невский проспект, 55, офис 2'
)

Office.create!(
  name: 'на Толстого',
  city: 'Казань',
  postindex: 420015,
  street_address: 'улица Льва Толстого, 14, офис 12'
)

Office.create!(
  name: 'на Руставели',
  city: 'Уфа',
  postindex: 450081,
  street_address: 'улица Шота Руставели, 25, офис 101'
)

admin = User.create! email: 'admin@example.com', password: 'password', role: 'admin'

51.times do |i|
  attributes = {
    title:          "this metatag title#{ i }",
    site:           "this metatag site#{ i }",
    description:    "this metatag description#{ i }",
    keywords:       "this metatag keywords#{ i }",
    noindex:        [false, true].sample,
    nofollow:       [false, true].sample,
    canonical_url:  "www.example#{ i }.com",
    author_link:    "www.autor#{ i }.com",
    publisher_link: "www.publisher#{ i }.com",

    name: "news title##{ i }",
    body: "body #{ i } "*300,
    user: admin
  }

  NewsItem.create! attributes
end
