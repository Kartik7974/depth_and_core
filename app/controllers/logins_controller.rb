class LoginsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def login
		account = Account.find_by(email: params[:email])
		
		if account&.authenticate(params[:password])
			render json: {
				status: 'success',
				message: 'Login successful',
				data: { email: account.email }
			}
		else
			render json: {
				status: 'error',
				message: 'Invalid email or password'
			}, status: :unauthorized
		end
	end
end
