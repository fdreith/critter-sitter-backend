class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    
    options = {is_collection: true, include:  [:households]}
    render json: UserSerializer.new(@users, options).serializable_hash.to_json
  end

  # GET /users/1
  def show
    render json: UserSerializer.new(@user, include: [:households]).serializable_hash.to_json
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user, include: [:households]).serializable_hash.to_json, status: :created
    else
      render jsonapi_errors: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user, include: [:households]).serializable_hash.to_json
    else
      render jsonapi_errors: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
