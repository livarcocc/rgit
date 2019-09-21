source "https://rubygems.org"

group :test do
  gem 'rake'
  gem 'rspec'
end

group :development do
  gem 'guard'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
end