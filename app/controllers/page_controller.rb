class PageController < ApplicationController

    def home 

    end

    def team 

    end

    def contact

    end

    def welcome 

        @first_name = params[:first_name]

    end

    def author 

        @author_first_name = Gossip.find(params[:id]).user.first_name
        @author_last_name = Gossip.find(params[:id]).user.last_name

    end


end
