class CharactersController < ApplicationController

    # create
    get '/characters/new' do
        @plot = Plot.find(session[:plot_id])
        erb :"characters/new"
    end

    post '/characters' do
        @plot = Plot.find(session[:plot_id])
        @character = Character.create(params[:character])
        if @character.valid?
            @plot.characters << @character # add to parent so relationship persists both ways
            redirect "/characters/#{@character.id}"
        else
            flash[:failure] = "Please try again."
            redirect "/characters/new"
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
        #@character.update(name: params["name"], role: params["role"], description: params["description"])
        @character.update(params[:character])
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
        @character.delete
        redirect "/plots/#{session[:plot_id]}"
    end
end