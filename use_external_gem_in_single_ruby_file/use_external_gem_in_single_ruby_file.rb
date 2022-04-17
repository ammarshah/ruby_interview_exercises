# This way we can install and use any external gem in a single ruby script/file

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rainbow'
end

# From here on, rainbow is available so I can 
# print colored text into my terminal

require 'rainbow'
puts Rainbow('This will be printed in red').red