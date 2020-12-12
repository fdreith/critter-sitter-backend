class CaresController < ApplicationController
  before_action :set_care, only: [:show, :update, :destroy]

  # GET /cares
  def index
    @cares = Care.all

    render json: CareSerializer.new(@cares).serializable_hash.to_json
  end

  # GET /cares/1
  def show
    render json: CareSerializer.new(@care).serializable_hash.to_json
  end

  # POST /cares
  def create
    @care = Care.new(care_params)

    if @care.save
      render json: CareSerializer.new(@care).serializable_hash.to_json, status: :created, location: @care
    else
      render jsonapi_errors: @care.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cares/1
  def update
    if @care.update(care_params)
      render json: CareSerializer.new(@care).serializable_hash.to_json
    else
      render jsonapi_errors: @care.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cares/1
  def destroy
    if @care.destroy
      render json: {message: "#{@care.care_type} is deleted from records."}, status: :ok
    else
      render json: {error: "#{@care.care_type} failed to delete from records."}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care
      @care = Care.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def care_params
      params.require(:care).permit(:type, :name, :details, :pet_id, :user_id, :attachment)
    end
end
