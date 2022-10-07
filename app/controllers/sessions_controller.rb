class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      user.regenerate_token
      if user.roles == "recruiter"
        render json: { company_name: user.company_name,
                       email: user.email, token: user.token }
      else
        render json: { email: user.email, token: user.token }
      end
    else
      respond_unauthorized("Incorrect email or password")
    end
  end

  # DELETE /logout
  def destroy
    current_user.invalidate_token
  end
end
