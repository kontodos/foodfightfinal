class RestaurantsController < ApplicationController

def index
	@restaurants = Restaurant.all
end

def new
	@restaurant = Restaurant.new
end
  
def create
	@restaurant = Restaurant.new( restaurant_params )
	@restaurant.name = params[:restaurant][:name]
	@restaurant.contact = params[:restaurant][:contact]
	@restaurant.address = params[:restaurant][:address]
	@restaurant.description = params[:restaurant][:description]
	#@restaurant.foods = []
	@restaurant.save!
	
	redirect_to :restaurants
end

def show
	@restaurant = Restaurant.find(params[:id])
	#Food.new
end

def edit
	@restaurant = Restaurant.find(params[:id])
end

  def update
	@restaurant = Restaurant.find(params[:id])
	@restaurant.name = params[:restaurant][:name]
	@restaurant.contact = params[:restaurant][:contact]
	@restaurant.address = params[:restaurant][:address]
	@restaurant.description = params[:restaurant][:description]
	@restaurant.save!
	@restaurants = Restaurant.all
	render :index
  end
  
    def destroy
	@restaurant = Restaurant.find(params[:id])
	@restaurant.destroy!
	redirect_to :action => :index

  end
  
  private
  
  def restaurant_params
	params.require(:restaurant).permit(:avatar)
  end

end
