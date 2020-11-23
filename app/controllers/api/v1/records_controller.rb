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
      render json: RecordSerializer.new(@record).serializable_hash.to_json, status: :created
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records/1
  def update
    if @record.update(record_params)
      render json: RecordSerializer.new(@record).serializable_hash.to_json
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records/1
  def destroy
    @record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def record_params
      params.require(:record).permit(:pet_id, :name, :details, :date)
    end
end
