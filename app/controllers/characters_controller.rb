class CharactersController < ApplicationController

    # create
    get '/plots/:id/characters/new' do
        @plot = Plot.find(params["id"].to_i)
        erb :"characters/new"
    end

    post '/plots/:id/characters' do
        @plot = Plot.find(params[:id].to_i)
        @character = Character.create(name: params["name"], role: params["role"], description: params["description"])
        if @character.valid?
            @plot.characters << @character
            redirect "/characters/#{@character.id}"
        else
            flash[:failure] = "Please try again."
            redirect "/plots/#{@plot.id}/characters/new"
        end
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
        if @character.valid?
            redirect "/characters/#{@character.id}"
        else
            flash[:failure] = "Please try again."
            redirect "/characters/#{@character.id}/edit"
        end
    end

    # delete
    delete '/characters/:id' do
        @character = Character.find(params[:id])
        @plot_id = @character.plot.id
        @character.delete
        redirect "/plots/#{@plot_id}"
    end
end