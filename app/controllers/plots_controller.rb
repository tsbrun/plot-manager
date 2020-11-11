class PlotsController < ApplicationController

    get '/plots' do
        @plots = current_user(session).plots
        erb :"plots/index"
    end

    get '/plots/new' do
        erb :"plots/new"
    end

    post '/plots' do
        @plot = Plot.new(params)
        current_user(session).plots << @plot
        redirect '/plots'
    end
end