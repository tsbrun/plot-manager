class PlotsController < ApplicationController

    get '/plots' do
        @plots = current_user(session).plots
        erb :"plots/index"
    end

    get '/plots/new' do
        if logged_in?(session)
            erb :"plots/new"
        else
            flash[:not_logged_in] = "Please log in."
            redirect '/login'
        end
    end

    post '/plots' do
        @plot = Plot.create(params)
        if @plot.valid?
            current_user(session).plots << @plot
            redirect '/plots'
        else
            flash[:failure] = "Please try again."
            redirect '/plots/new'
        end
    end

    get '/plots/:id' do
        @plot = Plot.find_by(id: params[:id], user_id: current_user(session).id
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
        if @plot.valid?
            redirect '/plots'
        else
            redirect "/plots/#{@plot.id}/edit"
        end
    end

    delete '/plots/:id' do
        @plot = Plot.find_by(id: params[:id], user_id: current_user(session).id)
        @plot.delete 
        redirect '/plots'
    end
end