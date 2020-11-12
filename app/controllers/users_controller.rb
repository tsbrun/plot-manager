class UsersController < ApplicationController

    get '/login' do
        erb :"users/login"
    end

    post '/login' do
        @user = User.find_by(name: params["name"], email: params["email"])
        if @user && @user.authenticate(params["password"])
            session[:user_id] = @user.id 
            flash[:login] = "You have successfully logged in as #{current_user(session).name}."
            redirect "/users/#{@user.id}"
        else
            if !params.empty?
                flash[:login_failed] = "Your login was unsuccessful."
            end
            redirect '/login'
        end
    end

    get '/users/:id' do
        binding.pry
        erb :"users/show"
    end

    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        @user = User.create(name: params["name"], email: params["email"], password: params["password"])
        if @user && @user.authenticate(params["password"])
            session[:user_id] = @user.id 
            flash[:login] = "You have successfully logged in as #{current_user(session).name}."
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