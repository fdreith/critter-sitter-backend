class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: EventSerializer.new(@events, include: [:user, :pet]).serializable_hash.to_json
  end

  # GET /events/1
  def show
    render json: EventSerializer.new(@event, include: [:user, :pet]).serializable_hash.to_json
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: EventSerializer.new(@event, include: [:user, :pet]).serializable_hash.to_json, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: EventSerializer.new(@event, include: [:user, :pet]).serializable_hash.to_json
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:pet_id, :user_id, :type, :ddetails, :date)
    end
end
