source 'https://rubygems.org'
ruby '2.2.2'

gem 'sinatra', '~> 1.4.6'

gem 'multi_json', '~> 1.11.2'
# hamlit is Broken right now, once it's fixed, switch haml and hamlit
gem 'haml'
# gem 'hamlit', '~> 1.7.2'

# Authentication stuff
gem 'warden', '~> 1.2.3'
gem 'oauth2', '~> 0.5.2'
gem 'warden-oauthed'
gem 'sinatra_auth_oauthed'


# Environmental variable configuration
gem 'dotenv', '~> 2.0.2'

group :development do
  gem 'rerun'
end

group :test do
  gem 'rspec', '~> 2.7'
  gem 'rack-test', require: 'rack/test'
  gem 'guard'
  gem 'addressable'
  gem 'guard-rubocop'
  gem 'guard-rspec', '~> 4.2.8'
end
