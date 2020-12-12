require 'test_helper'

class CaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @care = cares(:one)
  end

  test "should get index" do
    get cares_url, as: :json
    assert_response :success
  end

  test "should create care" do
    assert_difference('Care.count') do
      post cares_url, params: { care: { attachment: @care.attachment, details: @care.details, name: @care.name, pet_id: @care.pet_id, type: @care.type, user_id: @care.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show care" do
    get care_url(@care), as: :json
    assert_response :success
  end

  test "should update care" do
    patch care_url(@care), params: { care: { attachment: @care.attachment, details: @care.details, name: @care.name, pet_id: @care.pet_id, type: @care.type, user_id: @care.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy care" do
    assert_difference('Care.count', -1) do
      delete care_url(@care), as: :json
    end

    assert_response 204
  end
end
