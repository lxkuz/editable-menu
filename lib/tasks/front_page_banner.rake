namespace :front_page_banner do
  desc "Generate front page banners"
  task :generate => :environment do
    FrontPageBanner.create(name: 'top_left', title: 'Маршевые лестницы', price: '19000')
    FrontPageBanner.create(name: 'top_right', title: 'Маршевые лестницы', price: '19000')
    FrontPageBanner.create(name: 'center_left', title: 'Маршевые лестницы', price: '19000')
    FrontPageBanner.create(name: 'center_right', title: 'Маршевые лестницы', price: '19000')
    FrontPageBanner.create(name: 'bot_left', title: 'Маршевые лестницы', price: '19000')
    FrontPageBanner.create(name: 'bot_right', title: 'Маршевые лестницы', price: '19000')
    FrontPageBanner.create(name: 'bot_left_mini', title: 'Маршевые лестницы', price: '19000')
  end
end
