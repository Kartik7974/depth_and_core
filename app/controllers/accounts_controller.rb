class AccountsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def create
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
	        message: 'Account creation failed',
	        errors: @account.errors.full_messages
	      }, status: :unprocessable_entity
	    end
    end

	private
	def account_params
	    params.require(:account).permit(:email, :password)
	end
end
