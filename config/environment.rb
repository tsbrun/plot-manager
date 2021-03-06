ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require 'dotenv'
Dotenv.load

require './app/controllers/application_controller'
require './app/controllers/users_controller.rb'
require './app/controllers/plots_controller.rb'
require './app/controllers/characters_controller.rb'
require_all 'app'
