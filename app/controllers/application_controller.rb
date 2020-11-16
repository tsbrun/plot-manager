require './config/environment'
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]

    register Sinatra::Flash
  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?(session)
      !!session[:user_id]
    end

    def current_user(session)
      User.find(session[:user_id])
    end
  end

end
