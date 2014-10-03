require 'factory_girl'
require 'capybara/rspec'
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
