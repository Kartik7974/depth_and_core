class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :verify_authenticity_token  # For API requests

  def new
    respond_to do |format|
      format.html
      format.json { render json: { message: "Login form" } }
    end
  end

  def create
    user_params = params[:user] || params.dig(:session, :user)
    email = user_params[:email].downcase if user_params
    password = user_params[:password] if user_params
    
    if user&.authenticate(params[:password])
      user = User.find_by(email: email)
          format.html { redirect_to root_path, notice: 'Logged in successfully!' }
        format.json { render json: { status: 'success', user: user }, status: :ok }
    respond_to do |format|
      if user&.authenticate(password)
        session[:user_id] = user.id
        token = JsonWebToken::JsonWebTokenService.encode(user.id)
        format.html { redirect_to root_path, notice: 'Logged in successfully!' }
        format.json { 
          render json: {
            status: 'success',
            message: 'Login successful',
            user: {
              id: user.id,
              email: user.email
            },
            token: token
          }, status: :ok 
        }
      else
        format.html { render :new }
        format.json { 
          render json: {
            status: 'error',
            message: 'Invalid credentials',
          }, status: :unauthorized 
        }
      end
    end
  rescue => e
    respond_to do |format|
      format.html { render :new }
      format.json { 
        render json: {
          status: 'error',
          message: e.message
        }, status: :internal_server_error 
      }
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Logged out successfully!' }
      format.json { render json: { status: 'success', message: 'Logged out successfully' } }
    end
  end
end
