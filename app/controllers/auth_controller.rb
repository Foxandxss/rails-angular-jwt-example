class AuthController < ApplicationController
  require 'auth_token'

  def register
    user = User.new(user_params)
    if user.save
      token = AuthToken.issue_token({ user_id: user.id })
      render json: { user: user,
                     token: token }
    else
      render json: { errors: user.errors }
    end
  end

  def authenticate
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      token = AuthToken.issue_token({ user_id: user.id })
      render json: { user: user,
                     token: token }
    else
      render json: { error: "Invalid email/password combination" }, status: :unauthorized
    end
  end

  def token_status
    token = params[:token]
    if AuthToken.valid? token
      head 200
    else
      head 401
    end
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end