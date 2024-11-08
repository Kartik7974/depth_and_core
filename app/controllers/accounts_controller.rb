class AccountsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def create
		begin
			@account = Account.new(account_params)
			
			if @account.save
				render json: {
					status: 'success',
					message: 'Account created successfully',
					data: { email: @account.email }
				}, status: :created
			else
				render json: {
					status: 'error',
					message: @account.errors.full_messages
				}, status: :unprocessable_entity
			end
		rescue => e
			Rails.logger.error("Account creation error: #{e.message}")
			render json: {
				status: 'error',
				message: 'Internal server error'
			}, status: :internal_server_error
		end
	end

	private
	def account_params
	    params.require(:account).permit(:email, :password)
	end
end
