class SessionsController < ApplicationController
    
    def new
    end

    def create
        officer = Officer.authenticate(params[:username], params[:password])
        if officer
            session[:officer_id] = officer.id
            redirect_to home_path, notice: "Logged in!"
        else
            flash.now[:alert] = "Username and/or password is invalid"
            render action: 'new'
        end
    end

    def destroy
        session[:officer_id] = nil
        redirect_to home_path, notice: "Logged out!"
    end
end