class Api::V1::SessionsController < ApplicationController
  def create
     @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render json: JSONAPI::Serializer.serialize(@user, include: ['households']), status: :ok
    else
      render json: {
        error: "Invalid Credentials"
      }
    end
  end

  def get_current_user
    if logged_in?
      render json: JSONAPI::Serializer.serialize(@current_user, include: [ 'households'])
    else
      render json: {
        error: "No one logged in"
      }
    end
  end

  def destroy
    session.clear
    render json: {
      notice: "successfully logged out"
    }, status: :ok
  end
end
