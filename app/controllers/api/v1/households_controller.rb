class Api::V1::HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :update, :destroy]

  # GET /households
  def index
    @households = Household.all

    render json: HouseholdSerializer.new(@households, include: [:owner, :users, :pets]).serializable_hash.to_json
  end

  # GET /households/1
  def show
    render json: HouseholdSerializer.new(@household, include: [:owner, :users, :pets]).serializable_hash.to_json
  end

  # POST /households
  def create
    @household = Household.new(household_params)
    if @household.save
      @household.users << current_user
      render json: HouseholdSerializer.new(@household, include: [:owner, :users, :pets]).serializable_hash.to_json, status: :created
    else
      render json: @household.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /households/1
  def update
    if @household.update(household_params)
      render json: HouseholdSerializer.new(@household, include: [:owner, :users, :pets]).serializable_hash.to_json
    else
      render json: @household.errors, status: :unprocessable_entity
    end
  end

  # DELETE /households/1
  def destroy
    @household.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household
      @household = Household.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def household_params
      params.require(:household).permit(:name, :address, :owner_id, :password)
    end
end
