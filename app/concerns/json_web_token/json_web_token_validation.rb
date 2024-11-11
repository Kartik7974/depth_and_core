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

    def initialize_attributes_for(data)
      @struct = Struct.new(*data.keys.map(&:to_sym)).new
      data.keys.each do |key|
        @struct.send("#{key}=", data[key])
      end
    end

    def respond_to_missing?(method, *args)
      super || @struct.respond_to?(method)
    end

    def method_missing(method, *args, &block)
      return @struct.send(method) if @struct.respond_to?(method)
      super
    end
  end
end
