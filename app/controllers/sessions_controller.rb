class SessionsController < ApplicationController

  def session_params
    params.require(:session).permit(:user_id, :email)
  end

  def new
    #Empty on purpose in order to display the default view
  end

  def create
    @user = User.find_by_user_id(params[:session][:user_id])  # nil if user_id is not in db
    
    if (@user)
      if (@user.email == params[:session][:email])
        session[:session_token] = @user.session_token
        redirect_to movies_path
      else
        flash[:warning] = "Incorrect email adress."
        redirect_to login_path
      end
    else
      flash[:warning] = "Invalid user-id."
      redirect_to login_path
    end
  end

  def destroy
    # @movie = Movie.find(params[:id])
    # @movie.destroy
    # flash[:notice] = "Movie '#{@movie.title}' deleted."
    # redirect_to movies_path
  end

end
