class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    respond_to do |format|
      format.html
      format.json { render json: { message: "Login form" } }
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    
    respond_to do |format|
      if user&.authenticate(params[:user][:password])
        session[:user_id] = user.id
        format.html { redirect_to root_path, notice: 'Logged in successfully!' }
        format.json { 
          render json: {
            status: 'success',
            message: 'Login successful',
            user: {
              id: user.id,
              email: user.email
            }
          }, status: :ok 
        }
      else
        format.html { render :new }
        format.json { 
          render json: {
            status: 'error',
            message: 'Invalid credentials'
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
