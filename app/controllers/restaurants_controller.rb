class RestaurantsController < ApplicationController
before_action :authenticate_user!

def index
if current_user.email.include? 'admin@admin.com'
	@restaurants = Restaurant.all
	else
		redirect_to root_path
	end
end

def new
if current_user == nil
	redirect_to root_path
elsif current_user.email.include? 'admin@admin.com'
	@restaurant = Restaurant.new
else
	redirect_to root_path
end

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

end

def edit
if current_user == nil
	redirect_to root_path
elsif current_user.email.include? 'admin@admin.com'
	@restaurant = Restaurant.find(params[:id])
else
	redirect_to root_path
	end
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
