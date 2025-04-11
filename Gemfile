source 'https://rubygems.org'

ruby '3.3.5'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0', '>= 8.0.2'

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem 'propshaft', '~> 1.1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 2.6'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.6'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails', '~> 2.1'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails', '~> 2.0', '>= 2.0.13'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails', '~> 1.3', '>= 1.3.4'

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem 'tailwindcss-rails', '~> 4.2', '>= 4.2.2'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder', '~> 2.13'
gem 'mission_control-jobs', '~> 1.0', '>= 1.0.2'
gem 'solid_cache', '~> 1.0', '>= 1.0.7'
gem 'solid_queue', '~> 1.1', '>= 1.1.4'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem 'kamal', '~> 2.5', '>= 2.5.3', group: :deploy

gem 'faraday', '~> 2.13'

gem 'sentry-rails', '~> 5.23'

gem 'sentry-ruby', '~> 5.23'
