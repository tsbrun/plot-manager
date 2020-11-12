class CharactersController < ApplicationController

    get '/plots/:id/characters' do
        user = current_user(session)
        @plot = user.plots.find(params[:id].to_i)
        @characters = @plot.characters
        erb :"characters/index"
    end

    get '/plots/:id/characters/new' do
        binding.pry
        erb :"characters/new"
    end

    post '/plots/:id/characters' do
        binding.pry
        character = Character.create(name: params["name"], role: params["role"], description: params["description"])
        plot = Plot.find(params[:id])
        plot.characters << character
        redirect '/plots/:id/characters'
    end
end