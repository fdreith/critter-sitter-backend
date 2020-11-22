class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    
    render json: JSONAPI::Serializer.serialize(@users, is_collection: true, include:  ['households'])
  end

  # GET /users/1
  def show
    render json: JSONAPI::Serializer.serialize(@user, include: ['households'])
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: JSONAPI::Serializer.serialize(@user, include: ['households']), status: :created
    else
      render json: JSONAPI::Serializer.serialize_errors(@user.errors)
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: JSONAPI::Serializer.serialize(@user, include: ['households'])
    else
      render json: JSONAPI::Serializer.serialize_errors(@user.errors)
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
