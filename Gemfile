source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'jbuilder', '~> 2.5'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'draper'

gem 'sidekiq'

gem 'rails-observers', github: 'rails/rails-observers'
gem 'pg_search'
gem 'bcrypt'
gem 'kaminari'
gem 'email_validator'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :test do
  gem 'rspec-activemodel-mocks'
  gem 'rspec-its'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers'
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem "letter_opener"

end
