class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: EventSerializer.new(@events).serializable_hash.to_json
  end

  # GET /events/1
  def show
    render json: EventSerializer.new(@event).serializable_hash.to_json
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      binding.pry
      render json: EventSerializer.new(@event).serializable_hash.to_json, status: :created
    else
      render jsonapi_errors: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: EventSerializer.new(@event).serializable_hash.to_json
    else
      render jsonapi_errors: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    if @event.destroy
      render json: {message: "#{@event.event_type} is deleted from events."}, status: :ok
    else
      render json: {error: "#{@event.event_type} failed to delete from events."}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:event_type, :name, :details, :pet_id, :user_id, :date, :attachment)
    end
end
