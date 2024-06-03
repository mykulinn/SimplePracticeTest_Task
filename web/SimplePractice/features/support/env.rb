require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara'
require 'site_prism'
require 'rspec'
require 'faker'

require_relative 'page_objects'


Capybara.configure do |config|
  config.default_driver = :selenium_chrome
end

Capybara.default_max_wait_time = 30
