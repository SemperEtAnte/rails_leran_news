source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use sqlite3 as the database for Active Record
gem 'pg'
gem 'rswag'
gem 'bcrypt'
gem 'rack-cors'
gem 'puma', '~> 5.0'
gem "image_processing", ">= 1.2"
gem 'jwt'
gem 'bootsnap', '>= 1.4.4', require: false
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'rspec-rails'
  gem 'listen', '~> 3.3'
  gem 'spring'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
