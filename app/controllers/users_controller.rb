class UsersController < ApplicationController

    get '/login' do
        erb :"users/login"
    end

    post '/login' do
        @user = User.find_by(name: params["name"], email: params["email"])
        if @user && @user.authenticate(params["password"])
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else
            redirect '/login'
        end
    end

    get '/users/:id' do
        erb :"users/show"
    end

    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        @user = User.create(name: params["name"], email: params["email"], password: params["password"])
        if @user && @user.authenticate(params["password"])
            session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end