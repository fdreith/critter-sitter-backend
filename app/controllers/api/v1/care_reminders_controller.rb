class Api::V1::CareRemindersController < ApplicationController
  before_action :set_care_reminder, only: [:show, :update, :destroy]

  # GET /care_reminders
  def index
    @care_reminders = CareReminder.all

    render json: JSONAPI::Serializer.serialize(@care_reminders,  is_collection: true, include: ['pet'])
  end

  # GET /care_reminders/1
  def show
    render json: JSONAPI::Serializer.serialize(@care_reminder,  include: ['pet'])
  end

  # POST /care_reminders
  def create
    @care_reminder = CareReminder.new(care_reminder_params)

    if @care_reminder.save
      render json: JSONAPI::Serializer.serialize(@care_reminder,  include: ['pet']), status: :created
    else
      render json: JSONAPI::Serializer.serialize_errors(@care_reminder.errors)
    end
  end

  # PATCH/PUT /care_reminders/1
  def update
    if @care_reminder.update(care_reminder_params)
      render json: JSONAPI::Serializer.serialize(@care_reminder,  include: ['pet'])
    else
      render json: JSONAPI::Serializer.serialize_errors(@care_reminder.errors)
    end
  end

  # DELETE /care_reminders/1
  def destroy
    @care_reminder.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_reminder
      @care_reminder = CareReminder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def care_reminder_params
      params.require(:care_reminder).permit(:pet_id, :type, :date)
    end
end
