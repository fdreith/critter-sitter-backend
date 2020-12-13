class Api::V1::RecordsController < ApplicationController
  before_action :set_record, only: [:show, :update, :destroy]

  # GET /records
  def index
    @records = Record.all

    render json: RecordSerializer.new(@records).serializable_hash.to_json
  end

  # GET /records/1
  def show
    render json: RecordSerializer.new(@record).serializable_hash.to_json
  end

  # POST /records
  def create
    @record = Record.new(record_params)

    if @record.save
      render json: RecordSerializer.new(@record).serializable_hash.to_json, status: :created, location: @record
    else
      render jsonapi_errors: @record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records/1
  def update
    if @record.update(record_params)
      render json: RecordSerializer.new(@record).serializable_hash.to_json
    else
      render jsonapi_errors: @record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records/1
  def destroy
    if @record.destroy
      render json: {message: "#{@record.record_type} is deleted from records."}, status: :ok
    else
      render json: {error: "#{@record.record_type} failed to delete from records."}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = record.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def record_params
      params.require(:record).permit(:type, :name, :details, :pet_id, :user_id, :attachment)
    end
end
