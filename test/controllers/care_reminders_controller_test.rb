require 'test_helper'

class CareRemindersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @care_reminder = care_reminders(:one)
  end

  test "should get index" do
    get care_reminders_url, as: :json
    assert_response :success
  end

  test "should create care_reminder" do
    assert_difference('CareReminder.count') do
      post care_reminders_url, params: { care_reminder: { date: @care_reminder.date, pet_id: @care_reminder.pet_id, type: @care_reminder.type } }, as: :json
    end

    assert_response 201
  end

  test "should show care_reminder" do
    get care_reminder_url(@care_reminder), as: :json
    assert_response :success
  end

  test "should update care_reminder" do
    patch care_reminder_url(@care_reminder), params: { care_reminder: { date: @care_reminder.date, pet_id: @care_reminder.pet_id, type: @care_reminder.type } }, as: :json
    assert_response 200
  end

  test "should destroy care_reminder" do
    assert_difference('CareReminder.count', -1) do
      delete care_reminder_url(@care_reminder), as: :json
    end

    assert_response 204
  end
end
