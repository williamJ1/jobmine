class AdminController < ApplicationController
  def index
    @all_teen = Profile.where(user_type: "teen").all
    @all_employer = Profile.where(user_type: "employer").all
    @all_requests = Reactivate.all
    @all_review = Review.all

  end

  def new

  end

  def delete_review
    Review.where(id: params[:review_id]).destroy_all
    redirect_to index_admin_path
  end

  def create
    @u = User.find_by(email: params[:login][:email])
    if @u == nil
      flash[:warning] = 'Admin account does not exist'
      redirect_to admin_path
      return
    end

    if @u.try(:authenticate, params[:login][:password])
      session[:current_user_id] = @u.id
      redirect_to index_admin_path
      return
    else
      flash[:warning] = 'Wrong password'
      redirect_to admin_path
    end
  end

  def suspend
    @user = User.find_by(id: params[:teen_id])
    if params[:Suspend]
      User.where(id: params[:teen_id]).update_all(account_status: "suspended")
      #redirect_to update_timeslot_path
      redirect_to index_admin_path
    else
      User.where(id: params[:teen_id]).update_all(account_status: "activate")
      redirect_to index_admin_path
    end
  end


  def reactivate
    @request = Reactivate.new(params.require(:reactivate).permit(:username, :description))
    if @request.save()
      flash[:info] = "Submit successful!"
      redirect_to login_path
    else
      flash[:info] = "some thing went wrong"
      redirect_to login_path
    end
  end

end
