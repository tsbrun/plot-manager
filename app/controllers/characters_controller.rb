class CharactersController < ApplicationController

    # get '/plots/:id/characters' do
    #     user = current_user(session)
    #     @plot = user.plots.find(params[:id].to_i)
    #     @characters = @plot.characters
    #     erb :"characters/index"
    # end

    # READ all the characters of a specific plot by going to that plot's show view 

    # show
    get '/characters/:id' do
        @character = Character.find(params[:id])
        erb :"characters/show"
    end

    # create

    # update 

    # delete
    delete '/characters/:id' do
        @character = Character.find(params[:id])
        @plot_id = @character.plot.id
        @character.delete
        redirect "/plots/#{@plot_id}"
    end

    # get '/plots/:id/characters/new' do
    #     binding.pry
    #     erb :"characters/new"
    # end

    # post '/plots/:id/characters' do
    #     binding.pry
    #     character = Character.create(name: params["name"], role: params["role"], description: params["description"])
    #     plot = Plot.find(params[:id])
    #     plot.characters << character
    #     redirect '/plots/:id/characters'
    # end
end