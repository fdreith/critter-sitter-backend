class Api::V1::SessionsController < ApplicationController
  def create
     @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render json: UserSerializer.new(@user, include: [:households]).serializable_hash.to_json, status: :ok
    else
      errors = [{ "title": "Invalid Credentials", "detail": "You entered the wrong email or password." }]
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def get_current_user
    if logged_in?
      render json: UserSerializer.new(@current_user, include: [:households]).serializable_hash.to_json
    else
      errors = [{ "title": "No One Logged In", "detail": "You must be logged in." }]
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    session.clear
    render json: {
      notice: "successfully logged out"
    }, status: :ok
  end
end
