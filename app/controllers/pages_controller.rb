class PagesController < ApplicationController

 def home
	if current_user == nil
	@restaurants = Restaurant.all
	elsif current_user.email.include? 'admin@admin.com'
	redirect_to restaurants_path	
	else
	@restaurants = Restaurant.all
	end
  end
  
	def profile
		@user = current_user
		
	end
  def about
  end

  def contact
  end

  def foodfight
	@restaurants = Restaurant.all
  end
  
  def findresto
	@restaurant = Restaurant.find(params[:restaurant_id])
	@restaurant2 = Restaurant.find(params[:restaurant_id2])
  end
  
  
end
