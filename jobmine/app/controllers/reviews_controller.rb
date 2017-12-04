class ReviewsController < ApplicationController
	def index
		@current_profile_id = get_current_profile_id
		@profile = get_profile(params[:profile_id])
		@reviews = @profile.reviews.all
		@reviews.order(updated_at: :desc)
	end

	def show
		@current_profile_id = get_current_profile_id
		@review = Review.find(params[:id])
		@profile = get_profile(@review.profile_id)
	end

	def new
		$contract_id = params[:contract_id]
		@profile = get_profile(params[:profile_id])
		@cur_user_email = User.find(session[:current_user_id]).email
		@review = @profile.reviews.new
	end

	def edit
		@cur_user_email = User.find(session[:current_user_id]).email
		@review = Review.find(params[:id])
		@profile_obj = get_profile(@review.profile_id)
		@contract_id = params[:contract_id]
	end

	def create
		#contract_id = params[:contract_id]
		@profile = get_profile(params[:profile_id])
		@review = @profile.reviews.create(review_params.merge(:contract_id => $contract_id))

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

		if @review.update(review_params.merge(:contract_id => @review.contract_id))
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
		def get_current_profile_id
			return Profile.find_by(
			user_id: session[:current_user_id]).id
		end
		def review_params
			params.require(:review).permit(:rating, 
				:title, :body, :reviewer).merge(
				:reviewer_id => get_current_profile_id)
		end
		helper_method :get_profile, :get_current_profile_id
end
