class PagesController < ApplicationController

 def home
	@restaurants = Restaurant.all
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
	@restaurant = Restaurant.find(params[:id])
  end
  
  def pickfood
	
  end
  
  def comparefood
	
  end

  
end
