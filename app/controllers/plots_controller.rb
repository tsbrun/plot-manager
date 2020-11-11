class PlotsController < ApplicationController

    get '/plots' do
        @plots = current_user(session).plots
        erb :"plots/index"
    end

    get '/plots/new' do
        erb :"plots/new"
    end

    post '/plots' do
        @plot = Plot.create(params)
        current_user(session).plots << @plot
        redirect '/plots'
    end

    get '/plots/:id' do
        @plot = Plot.find_by(id: params[:id], user_id: current_user(session).id)
        erb :"plots/show"
    end

    get '/plots/:id/edit' do
        @plot = Plot.find_by(id: params[:id], user_id: current_user(session).id)
        erb :"plots/edit"
    end

    patch '/plots/:id' do
        binding.pry
        @plot = Plot.find_by(id: params[:id], user_id: current_user(session).id)
        @plot.update(title: params["title"], summary: params["summary"])
        redirect '/plots'
    end

    delete '/plots/:id' do
        @plot = Plot.find_by(id: params[:id], user_id: current_user(session).id)
        @plot.delete 
        redirect '/plots'
    end
end