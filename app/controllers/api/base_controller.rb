module Api
  class BaseController < ApplicationController
    require 'auth_token'

    before_action :authenticate

    private

      def authenticate
        begin
          token = request.headers['Authorization'].split(' ').last
          payload, header = AuthToken.valid?(token)
          @current_user = User.find_by(id: payload['user_id'])
        rescue
          render json: { error: 'Authorization header not valid'}, status: :unauthorized
        end
      end
  end
end