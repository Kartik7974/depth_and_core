class LoginsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def login
		account = Account.find_by(email: login_params[:email])
		
		if account&.authenticate(login_params[:password])
			token = JWT.encode(
				{ account_id: account.id, exp: 24.hours.from_now.to_i },
				Rails.application.secrets.secret_key_base
			)
			
			render json: {
				status: 'success',
				message: 'Login successful',
				data: {
					email: account.email,
					token: token
				}
			}
		else
			render json: {
				status: 'error',
				message: 'Invalid email or password'
			}, status: :unauthorized
		end
	end

	private

	def login_params
		params.require(:account).permit(:email, :password)
	end
end
