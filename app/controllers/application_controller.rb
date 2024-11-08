class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  private
  
  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JWT.decode(header, Rails.application.secrets.secret_key_base)[0]
      @current_user = Account.find(@decoded['account_id'])
    rescue JWT::DecodeError
      render json: { errors: ['Invalid token'] }, status: :unauthorized
    end
  end
end
