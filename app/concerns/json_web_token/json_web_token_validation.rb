# frozen_string_literal: true

module JsonWebToken
  module JsonWebTokenValidation
    extend ActiveSupport::Concern

    ALGORITHM = 'HS256'

    def jwt_encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base, ALGORITHM)
    end

    def jwt_decode(token)
      decoded = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: ALGORITHM })[0]
      HashWithIndifferentAccess.new(decoded)
    rescue JWT::DecodeError => e
      nil
    end
  end
end
