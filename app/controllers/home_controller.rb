class HomeController < ApplicationController
  def index
    render json: {
      message: "Welcome to the API",
      version: "1.0",
      endpoints: {
        health_check: "/healthz",
        signup: "/signup",
        login: "/login"
      }
    }
  end
end
