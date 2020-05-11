
require 'pry'
class SessionsController < ApplicationController

    def new

    end

    def create

        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            
            session[:user_id] = user.id 
            log_in(current_user)
            redirect_to gossips_path 

         else 
            flash[:notice] = "Le profil/mot de passe n'existe pas. Merci de réessayer ou de créer un profil"
            render :new

        end

    end

    def destroy 

        session.delete(:user_id)
        @current_user = nil 
        redirect_to gossips_path
        
    end
    
end
