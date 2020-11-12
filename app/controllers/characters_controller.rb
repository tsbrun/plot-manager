class CharactersController < ApplicationController

    # create
    get '/plots/:id/characters/new' do
        @plot = Plot.find(params["id"].to_i)
        erb :"characters/new"
    end

    post '/plots/:id/characters' do
        @plot = Plot.find(params[:id].to_i)
        @character = Character.create(name: params["name"], role: params["role"], description: params["description"])
        @plot.characters << @character
        redirect "/characters/#{@character.id}"
    end

    # READ all the characters of a specific plot by going to that plot's show view 

    # show route
    get '/characters/:id' do
        @character = Character.find(params[:id])
        erb :"characters/show"
    end

    # update
    get '/characters/:id/edit' do
        @character = Character.find(params[:id].to_i)
        erb :"characters/edit"
    end 

    patch '/characters/:id' do
        @character = Character.find(params[:id])
        @character.update(name: params["name"], role: params["role"], description: params["description"])
        redirect "/characters/#{@character.id}"
    end

    # delete
    delete '/characters/:id' do
        @character = Character.find(params[:id])
        @plot_id = @character.plot.id
        @character.delete
        redirect "/plots/#{@plot_id}"
    end
end