class LoginsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def login
		account = Account.find_by(email: params[:email], password: params[:password])
		if account.present?
			 token = encode(account.id)
			 render json: { account: account, login_token: token}, status: :created
		else
			render json: { error: 'Invalid email or password' }, status: :unauthorized
		end
	end


	private


	def encode(id)
		token = JsonWebToken::JsonWebTokenService.encode(id)
	end
end
