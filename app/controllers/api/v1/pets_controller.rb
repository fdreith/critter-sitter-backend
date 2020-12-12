class Api::V1::PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index
    @pets = Pet.all

    render json: PetSerializer.new(@pets, include: [:owner, :household, :records, :care_reminders, :events]).serializable_hash.to_json

  end

  # GET /pets/1
  def show
    render json: PetSerializer.new(@pet, include: [:owner, :household, :records, :care_reminders, :events]).serializable_hash.to_json
  end

  # POST /pets
  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      render json: PetSerializer.new(@pet, include: [:owner, :household, :records, :care_reminders, :events]).serializable_hash.to_json, status: :created
    else
      render jsonapi_errors: @pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pets/1
  def update
    if @pet.update(pet_params)
      render json: PetSerializer.new(@pet, include: [:owner, :household, :records, :care_reminders, :events]).serializable_hash.to_json
    else
      render jsonapi_errors: @pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pets/1
  def destroy
    if @pet.destroy
      render json: {message: "Pet is deleted from records."}, status: :ok
    else
      render json: {error: "Pet failed to delete from records."}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pet_params
      params.require(:pet).permit(:name, :care, :household_id, :owner_id)
    end
end
