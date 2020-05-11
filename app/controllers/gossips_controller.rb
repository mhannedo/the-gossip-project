require 'pry'

class GossipsController < ApplicationController

    before_action :authenticate_user, only: [:new, :create, :index]

def new
 
    @gossip = Gossip.new
    
end

def create

    @gossip = Gossip.create(params_gossip)
    @gossip.user = current_user

    if @gossip.save

        flash[:notice] = "Le potin a été sauvé "
        redirect_to gossips_url 

    else 
        flash[:notice] = "Nous n avons pas réussi à créer le potin pour la (ou les) raison(s) suivante(s) :"
        render :new 

    end
  
end

def index

end


def show 

    @gossip = Gossip.find(params[:id])
    @comment = Comment.new 
   
end

def edit 

    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user
        flash[:notice] = "Cette action n'est pas autorisée."
        redirect_to gossip_path(params[:id])
    end

end


def update 

    @gossip = Gossip.find(params[:id])

    if current_user == @gossip.user

        if @gossip = @gossip.update(params_gossip)
        
            redirect_to gossips_url, :notice => "Le potin a été modifié " 
        else 
            render :edit
        end
    else 
        flash[:notice] = "Cette action n'est pas autorisée."
        redirect_to gossip_path(params[:id])
    end

end

def destroy
     
    @gossip = Gossip.find(params[:id])
    if current_user == @gossip.user
      
        @gossip.destroy
        @gossip.comments.each do|comment| 
            comment.destroy
        end

        redirect_to gossips_url, :notice => "Le potin a été supprimé"
         
    else
        flash[:notice] = "Cette action n'est pas autorisée."
        redirect_to gossip_path(params[:id])
       
    end

end


private 

    def params_gossip

        return params.require(:gossip).permit(:title,:content)

    end

    

end
