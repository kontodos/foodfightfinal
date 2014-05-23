class ReviewsController < ApplicationController
before_action :authenticate_user!

  def index
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
  end
	
  def new
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.new
  end
  
  def create
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.new
	
	@user = current_user
	
	@review.content = params[:review][:content]
	@review.posted_on = DateTime.now
	@review.rating = params[:review][:rating]
	@review.user = current_user
	
	@review.save!	
	
	
	@food.reviews << @review
	
	#TO ADD RATING TO FOOD
	@food.rating = 0
	@food.reviews.each do |r| #for all the reviews of the specific food.. add it to x
		@food.rating = @food.rating.to_i + r.rating.to_i
	end
	
	@food.rating = @food.rating.to_i / (@food.reviews.count )
	
	@food.save!
	
	#TO ADD RATING TO Restaurant
	@restaurant.rating = 0
	@restaurant.foods.each do |f|
		@restaurant.rating = @restaurant.rating.to_i + f.rating.to_i
	end
	
	@restaurant.rating = @restaurant.rating.to_i / (@restaurant.foods.count)
	
	@restaurant.save!
	
	#END
	
	@user.reviews << @review
	@user.save!
	
	redirect_to restaurant_food_path(@restaurant.id, @food.id)
  end
  
  def edit
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.find(params[:id])
  end
  
  def update
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.find(params[:id])
	
	@review.content = params[:review][:content]
	@review.posted_on = DateTime.now
	@review.rating = params[:review][:rating]
	
	@review.save!
	
	redirect_to restaurant_food_path(@restaurant.id, @food.id)
  end
  
  def destroy
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.find(params[:id])
	@review.destroy!
	
	
	#GET THE REVIEW OF FOOD
	@food.rating = 0
	
	@food.reviews.each do |r| #for all the reviews of the specific food.. add it to x
		@food.rating = @food.rating.to_i + r.rating.to_i
	end
	
	if @food.reviews.count == 0
		@food.rating = 0
		
	else
		@food.rating = @food.rating.to_i / (@food.reviews.count)
	end
	@food.save!
	
	#GET THE REVIEW OF RESTO
	@restaurant.rating = 0
	
	@restaurant.foods.each do |f|
		@restaurant.rating = @restaurant.rating.to_i + f.rating.to_i
	end
	
	@restaurant.rating = @restaurant.rating.to_i / (@restaurant.foods.count)
	
	@restaurant.save!
	
	
	redirect_to restaurant_food_path(@restaurant.id, @food.id)
  end
    
end
