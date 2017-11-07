class PaymentsController < ApplicationController

	def index
                @payments = Payment.all
        end

	def show
		@payment = Payment.find(params[:id])
	end

	def new
		@payment = Payment.new
	end

	def edit
		@payment = Payment.find(params[:id])
	end

	def create
		@payment = Payment.new(payment_params)

                if @payment.save
                        redirect_to @payment
                else
                        render 'new'
                end
        end

	def update
                @payment = Payment.find(params[:id])

                if @payment.update(review_params)
                        redirect_to @payment
                else
                        render 'edit'
                end
        end

        def destroy
                @payment = Payment.find(params[:id])
                @payment.destroy

                redirect_to payments_path
        end

        private
                def payment_params
                        params.require(:payment).permit(:profile_id, :card_num, :card_holder_name)
                end


end
