require 'test_helper'

class UserHouseholdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_household = user_households(:one)
  end

  test "should get index" do
    get user_households_url, as: :json
    assert_response :success
  end

  test "should create user_household" do
    assert_difference('UserHousehold.count') do
      post user_households_url, params: { user_household: { household: @user_household.household, user_id: @user_household.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_household" do
    get user_household_url(@user_household), as: :json
    assert_response :success
  end

  test "should update user_household" do
    patch user_household_url(@user_household), params: { user_household: { household: @user_household.household, user_id: @user_household.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_household" do
    assert_difference('UserHousehold.count', -1) do
      delete user_household_url(@user_household), as: :json
    end

    assert_response 204
  end
end
