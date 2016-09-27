class UsersController < ApplicationController
  def user_params
    params.require(:user_id).permit(:email)
  end
  
  def new
    #Empty on purpose in order to display the default view
  end

  def create
    begin 
      @user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound
      @user = User.create!(user_params)
      flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
      redirect_to movies_path
    end
    flash[:notice] = "Sorry, this user-id is taken. Try again."
    redirect_to new_user_path
      
    # if (@user == nil)
    #   @user = User.create!(user_params)
    #   flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
    #   redirect_to movies_path
    # else
    #   flash[:notice] = "Sorry, this user-id is taken. Try again."
    #   redirect_to new_user_path
    # end
  end
end
