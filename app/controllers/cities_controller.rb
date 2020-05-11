class CitiesController < ApplicationController

    def show 

        @city = Gossip.find(params[:id]).user.city 
        
    end

end
