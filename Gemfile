source 'https://rubygems.org'
ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.10'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '3.0.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

#ANGULAR

# Injects Angular.js into your asset pipeline as well as other Angular modules.
gem 'angularjs-rails'
# Use your angular templates with rails' asset pipeline
gem 'angular-rails-templates'

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.1.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.0.1'
gem 'bootstrap-sass', '3.3.6'
gem 'jquery-turbolinks', '2.1.0'

# JSON API

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.4.1'
# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'jwt'
# Easy way to build and manage commands (service objects)
gem 'simple_command'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password

gem 'bcrypt', '~> 3.1.16'
gem 'faker', '1.6.6'
gem 'will_paginate',           '3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'

# IMAGE MANIPULATION

# rQRCode is a library for encoding QR Codes.
gem 'rqrcode'
# Read/write access to PNG images in pure Ruby.
gem 'chunky_png'
#Glues rQRCode together with chunky_png
gem 'rqrcode_png'
# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
gem 'mini_magick', '4.5.1'
# Dragonfly is a framework that enables on-the-fly processing for any content type. It is especially suited to image handling.
gem 'dragonfly', '~> 1.0.12'
# S3 data store for Dragonfly
gem 'dragonfly-s3_data_store', '~> 1.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'pdfkit', '0.8.5'
gem 'render_anywhere'
gem 'wkhtmltopdf-binary', '0.12.6.5'
gem 'compass-rails'
gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
gem 'ransack'
gem 'newrelic_rpm'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '3.1.1'
  gem 'listen', '3.0.8'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.7.2'
  gem 'spring-watcher-listen', '2.0.0'
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
