
require 'pry'
class CommentsController < ApplicationController

    before_action :authenticate_user, only: [:new, :create]

    def new

        @comment = Comment.new
    end


    def create 

        @comment = Comment.create(content: params_comment[:content],gossip: Gossip.find(params[:gossip_id]), user:current_user)

    end

    def edit
 
        @comment = Comment.find(params[:id])
        @id_comment = @comment.id 

    end

    def update 

        @comment = Comment.find(params[:id])
        @id_gossip = @comment.gossip_id
    
        if @comment = @comment.update(content: params_comment[:content])
        
            
            redirect_to gossip_path(@id_gossip), :notice => "Le commentaire a été modifié " 

        else 
            render :edit
        
        end
    end


    def destroy 
     
        @comment = Comment.all.find(params[:id])
        @comment.destroy 

        redirect_to gossip_path(@comment.gossip_id), :notice => "Le commentaire a été effacé " 
    end



private 

    def params_comment

        return params.require(:comment).permit(:content)

    end

end
