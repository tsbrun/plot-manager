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
            flash[:login_failed] = "Your login was unsuccessful."
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
        @user = User.create(params[:user])
        if @user.valid? && @user.authenticate(params[:user]["password"])
            session[:user_id] = @user.id 
            flash[:login] = "You have successfully logged in as #{current_user(session).name}."
            redirect "/users/#{@user.id}"
        else
            flash[:signup_failed] = "Your signup was unsuccessful. Please enter all fields and use a unique email."
            redirect '/signup'
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end