class SessionsController < ApplicationController
    before_action :login_redirect_to, only: [:new, :create]
    def new
        
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "you have successfully logged in"
            redirect_to root_path
        else
            flash.now[:error] = "There was something wrong in you information"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out"
        redirect_to login_path
    end

    private

    def login_redirect_to
        if logged_in?
            flash[:error] = "You have alerady logged in"
            redirect_to root_path
        end
    end
end