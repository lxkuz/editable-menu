Office.create!(
  name: 'на Пятницкой',
  city: 'Москва',
  postindex: 119017,
  street_address: 'Пятницкая улица, 39, офис 205'
)

Office.create!(
  name: 'на Руставели',
  city: 'Уфа',
  postindex: 450081,
  street_address: 'улица Шота Руставели, 25, офис 101'
)

admin = User.create! email: 'admin@example.com', password: 'password', role: 'admin'
puts 'Admin created!'

2.times do |i|
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
  puts 'News items created!'
end

Article.create!(
  title: "Почему сосновые лестницы лучше?",
  title_translit: "pochemu_sosnovye_lestnicy_luchshe",
  description: "Вы наверняка слышали, что сосновые лестницы самые лучшие? Да, это правда!",
  keywords: "сосна, лестницы, деревянные лестницы, купить в москве",
  content: "<h3>Почему сосновые лестницы лучше?</h3><br><p>По современным данным существует около 120 видов сосны, которые в естественном произрастании рассеяны по всему Северному полушарию от экватора до заполярья. В умеренном и субарктическом климате они образуют леса на равнинах, а в субтропиках, тропиках и вблизи экватора произрастают в горах.</p><p>Виды сосны, дающие съедобные орехи, условно объединяются под названием кедровые сосны. Однако надо помнить, что Кедр (Cedrus) — другой род деревьев того же семейства, а семена сосны не являются орехами в ботаническом смысле.</p><p><img alt=\"\" title=\"\" src=\"/media/W1siZiIsIjIwMTQvMTAvMDUvMDFfMzZfNDZfNzZfZmlsZSJdLFsicCIsInRodW1iIiwiMTk5eDI5OSJdXQ.jpeg\" class=\"\"><br></p>")
