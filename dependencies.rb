ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'

%w(
  grape
  sinatra
).each { |dep| require dep }

$env = ENV['RACK_ENV']
