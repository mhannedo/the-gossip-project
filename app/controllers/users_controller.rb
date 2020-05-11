require 'pry'

class UsersController < ApplicationController

    def new 

    @user = User.new 
    
    end

    def create 

        @user = User.create(user_params)
        @user.city = City.first

        if @user.save 

            log_in(@user)
            redirect_to gossips_path, notice => "L'utilisateur a été crée"
        
        else
            
            flash[:notice] = "Erreur dans la création d'un nouvel utilisateur"
            render :new 
       
        end

    end



    def show 
        @gossip = Gossip.find(params[:id])
        @user = Gossip.find(params[:id]).user 
    
    end


    private 

    def user_params 

        return params.require(:user).permit(:first_name,:last_name,:email,:password)
    end


end
