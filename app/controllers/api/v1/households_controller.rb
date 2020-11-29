class Api::V1::HouseholdsController < ApplicationController
      include JSONAPI::Errors

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
      user_params[:users].each do |user, v|
        @household.users << (User.find(user[:value].to_i))
      end

      render json: HouseholdSerializer.new(@household, include: [:owner, :users, :pets]).serializable_hash.to_json, status: :created
    else
      render jsonapi_errors: @household.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /households/1
  def update
    if @household.update(household_params)
      render json: HouseholdSerializer.new(@household, include: [:owner, :users, :pets]).serializable_hash.to_json
    else
      render jsonapi_errors: @household.errors, status: :unprocessable_entity
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
      params.require(:household).permit(:name, :address, :password, :owner_id)
    end

    def user_params
      params.require(:users).permit({users: [:label, :value]})
    end

    def render_jsonapi_internal_server_error(exception)
      # Call your exception notifier here. Example:
      # Raven.capture_exception(exception)
      super(exception)
    end
end
