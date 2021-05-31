class ReviewsController < ApplicationController 
  before_action :find_product
  before_action :find_review, only: [:edit, :update, :destroy]

    def show
       @product = Product.friendly.find(params[:product_id])
       @review = @product.reviews.friendly.find(params[:id])
       @review.destroy
       redirect_to product_path(@product)
       @reviews = Review.where(product_id: @product.id).order("created_at DESC")
    end

	def new
	   @review = Review.new
	end

	def create
	   @review = Review.new(review_params)
	   @review.product_id = @product.id
	   @review.user_id = current_user.id

	   if @review.save
	   	redirect_to product_path(@product)
	   else
	   	render 'new'
	   end
	end

	def edit
	end

	def update
	   if @review.update(review_params)
	  	redirect_to product_path(@product)
	   else
	   	render 'edit'
	   end
	end

	def destroy
	   @review.destroy
	   redirect_to product_path(@product)
	end

	private

	  def review_params
		params.require(:review).permit(:rating, :comment)
	  end

	  def find_product
	   @product = Product.friendly.find(params[:product_id])
	  end

	  def find_review
	   @review = Review.friendly.find(params[:id])
	  end

end
