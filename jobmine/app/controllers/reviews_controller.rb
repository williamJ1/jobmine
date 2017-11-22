class ReviewsController < ApplicationController
	def index
		@profile = get_profile(params[:profile_id])
		@reviews = @profile.reviews.all
	end

	def show
		@review = Review.find(params[:id])
		@profile = get_profile(@review.profile_id)
	end

	def new
		$contract_id = params[:contract_id]
		@profile = get_profile(params[:profile_id])
		@cur_user_email = User.find(session[:current_user_id]).email
#		@contract = Contract.find_by(params[:contract_id])
		@review = @profile.reviews.new
	end

	def edit
		@cur_user_email = User.find(session[:current_user_id]).email
		@review = Review.find(params[:id])
	end

	def create
		@profile = get_profile(params[:profile_id])
		@review = @profile.reviews.create(review_params)

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
		@profile = get_profile(@review.profile_id)
		@review.destroy

		redirect_to profile_reviews_path(@profile)
	end

	private 
		def get_profile(profile_id)
			return Profile.find(profile_id)
		end
		def review_params
			params.require(:review).permit(:rating, 
				:body, :reviewer).merge(:contract_id => $contract_id)
		end
		helper_method :get_profile
end
