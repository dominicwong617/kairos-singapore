source 'https://rubygems.org'

gem 'rails', '3.2.16'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :development do
  gem 'mailcatcher' # Send e-mails in development environment
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'handlebars_assets' # JS template engine
end

gem 'figaro' # For ENV variables
gem 'pg' #postgresql

gem 'devise' # user management
gem 'flag_shih_tzu' # collection of boolean attributes in a single integer column
gem 'paperclip', git: 'git://github.com/thoughtbot/paperclip.git' # file attachment tool
gem 'aws-sdk', '~> 1.32.0'
gem 'nested_form' 
gem 'tinymce-rails' # WYSIWYG editor
gem 'select2-rails'

gem 'friendly_id', '~> 4.0.10' # Friendly URL
gem 'state_machine' # for project event registrations' states

gem 'rails_12factor', group: :production # Logging and static assets config

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'debugger'

ruby '2.0.0'
