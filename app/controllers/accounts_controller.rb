class AccountsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def create
		@account = Account.new(account_params)
		if @account.save
			render json: { message: "account created successfully", account: @account }, status: :created
	    else
	      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
	    end
    end

	private
	def account_params
	    params.require(:account).permit(:email, :password, :full_name)
	end
end
