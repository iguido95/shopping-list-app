module Api
  class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session
    before_action :authenticate_user!




    def authenticate_user!
      token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

      user_email = options.blank?? nil : options[:email]
      user = user_email && User.find_by(email: user_email)

      if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
        @current_user = user
      else

      end

    end


  end
end
