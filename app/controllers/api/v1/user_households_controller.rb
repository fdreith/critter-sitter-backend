class UserHouseholdsController < ApplicationController
  before_action :set_user_household, only: [:show, :update, :destroy]

  # GET /user_households
  def index
    @user_households = UserHousehold.all

    render json: @user_households
  end

  # GET /user_households/1
  def show
    render json: @user_household
  end

  # POST /user_households
  def create
    @user_household = UserHousehold.new(user_household_params)

    if @user_household.save
      render json: @user_household, status: :created, location: @user_household
    else
      render json: @user_household.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_households/1
  def update
    if @user_household.update(user_household_params)
      render json: @user_household
    else
      render json: @user_household.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_households/1
  def destroy
    @user_household.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_household
      @user_household = UserHousehold.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_household_params
      params.require(:user_household).permit(:user_id, :household)
    end
end
