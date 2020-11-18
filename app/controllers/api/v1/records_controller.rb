class Api::V1::RecordsController < ApplicationController
  before_action :set_record, only: [:show, :update, :destroy]

  # GET /records
  def index
    @records = Record.all

    render json: JSONAPI::Serializer.serialize(@records, is_collection: true, include: ['pet'])
  end

  # GET /records/1
  def show
    render json: JSONAPI::Serializer.serialize(@record,  include: ['pet'])
  end

  # POST /records
  def create
    @record = Record.new(record_params)

    if @record.save
      render json: JSONAPI::Serializer.serialize(@record,  include: ['pet']), status: :created
    else
      render json: JSONAPI::Serializer.serialize_errors(@record.errors)
    end
  end

  # PATCH/PUT /records/1
  def update
    if @record.update(record_params)
      render json: JSONAPI::Serializer.serialize(@record,  include: ['pet'])
    else
      render json: JSONAPI::Serializer.serialize_errors(@record.errors)
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
