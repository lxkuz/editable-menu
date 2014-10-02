# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

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
