class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token  # For API requests
  
  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: { message: "Sign up form" } }
    end
  end

  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Account created successfully!' }
        format.json { render json: { status: 'success', user: @user }, status: :created }
      else
        format.html { render :new }
        format.json { render json: { status: 'error', errors: @user.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
