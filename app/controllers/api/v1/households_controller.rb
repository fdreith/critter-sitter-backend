class Api::V1::HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :update, :destroy]

  # GET /households
  def index
    @households = Household.all

    render json: JSONAPI::Serializer.serialize(@households, is_collection: true, include: ['owner', 'users', 'pets'])
  end

  # GET /households/1
  def show
    render json: JSONAPI::Serializer.serialize(@household,  include: ['owner', 'users', 'pets'])
  end

  # POST /households
  def create
    #!!!! NOT SAVING HOUSEHOLD
    binding.pry
    @household = Household.new(household_params)
    if @household.save
      @household.users << current_user
      render json: JSONAPI::Serializer.serialize(@household,  include: ['owner', 'users', 'pets']), status: :created, location: @household
    else
      render json: JSONAPI::Serializer.serialize_errors(@household.errors)
    end
  end

  # PATCH/PUT /households/1
  def update
    if @household.update(household_params)
      render json: JSONAPI::Serializer.serialize(@household,  include: ['owner', 'users', 'pets'])
    else
      render json: JSONAPI::Serializer.serialize_errors(@household.errors)
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
      params.require(:household).permit(:name, :address, :owner_id, :password_digest)
    end
end
