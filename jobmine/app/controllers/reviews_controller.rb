class ReviewsController < ApplicationController
	def index
		@reviews = Review.all
	end

	def show
		@review = Review.find(params[:id])
	end

	def new
		@review = Review.new
	end

	def edit
		@review = Review.find(params[:id])
	end

	def create
		@review = Review.new(review_params)

		if @review.save
			redirect_to @review
		else
			render 'new'
		end
	end

# => Testing
#	def create
#		render plain: params[:review].inspect
#	end

	def update
		@review = Review.find(params[:id])

		if @review.update(review_params)
			redirect_to @review
		else
			render 'edit'
			# => Error when updating empty body element.
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy

		redirect_to reviews_path
	end

	private 
		def review_params
			params.require(:review).permit(:rating, :body)
		end
end
