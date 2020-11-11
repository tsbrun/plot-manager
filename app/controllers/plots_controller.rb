class PlotsController < ApplicationController

    get '/plots' do
        # next time around, login and check the session[:user_id]
        # binding.pry
        @plots = current_user(session).plots
        erb :"plots/index"
    end
end