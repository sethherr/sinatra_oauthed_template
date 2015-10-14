ENV['RACK_ENV'] ||= 'development'

require 'rubygems' unless defined?(Gem)
require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)
require 'dotenv'
Dotenv.load

require 'sinatra/base'

require './config/routes.rb'
