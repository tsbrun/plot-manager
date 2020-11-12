class CharactersController < ApplicationController

    get '/plots/:id/characters' do
        user = current_user(session)
        @plot = user.plots.find(params[:id].to_i)
        @characters = @plot.characters
        erb :"characters/index"
    end
end