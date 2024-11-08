class SessionsController < ApplicationController
  def new
    # Render the login form
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to their profile
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      # Create an error message
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    # Log out the user
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully logged out!'
  end
end
