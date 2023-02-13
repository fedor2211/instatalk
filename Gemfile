source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.4'

gem 'bootsnap', require: false
gem 'dotenv-rails', '~> 2.8'
gem 'faker', '~> 3.1'
gem 'jsbundling-rails', '~> 1.1'
gem 'pg', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'redis', '~> 4.0'
gem 'sprockets-rails', '~> 3.4'
gem 'turbo-rails'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "bullet", "~> 7.0"
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'solargraph', '~> 0.48.0'
  gem "capistrano", "~> 3.17"
  gem "capistrano-rails", "~> 1.6"
  gem "capistrano-passenger", "~> 0.2.1"
  gem "capistrano-rbenv", "~> 2.2"
  gem "capistrano-bundler", "~> 2.1"
end
