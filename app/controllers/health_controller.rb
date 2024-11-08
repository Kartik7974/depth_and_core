class HealthController < ApplicationController
  def check
    render json: {
      status: 'ok',
      message: 'API is running',
      timestamp: Time.current
    }
  end
end
