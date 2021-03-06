class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show 
        @attraction = Attraction.find_by_id(params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end 

    def new 
        @attraction = Attraction.new
    end
    
    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
          redirect_to attraction_path(@attraction)
        else
          render 'new', :alert => "Please Fill In All Forms"
        end
    end
    
    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find_by_id(params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction), :alert => "You Just Updated The Attraction"
          else
            render 'edit', :alert => "Please Fill In All Forms"
        end
    end




private 
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
