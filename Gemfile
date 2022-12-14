source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby  File.read('.ruby-version').strip
gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sprockets-rails'

gem 'rails', '~> 7.0.4'
group :development do
  gem 'web-console'
end

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end

