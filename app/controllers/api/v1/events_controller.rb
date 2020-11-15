class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: JSONAPI::Serializer.serialize(@events, is_collection: true, include: ['pet', 'user'])
  end

  # GET /events/1
  def show
    render json: JSONAPI::Serializer.serialize(@event,  include: ['pet', 'user'])
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: JSONAPI::Serializer.serialize(@event,  include: ['pet', 'user']), status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: JSONAPI::Serializer.serialize(@event,  include: ['pet', 'user'])
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
