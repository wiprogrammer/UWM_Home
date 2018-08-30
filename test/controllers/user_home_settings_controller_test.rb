require 'test_helper'

class UserHomeSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_home_setting = user_home_settings(:one)
  end

  test "should get index" do
    get user_home_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_user_home_setting_url
    assert_response :success
  end

  test "should create user_home_setting" do
    assert_difference('UserHomeSetting.count') do
      post user_home_settings_url, params: { user_home_setting: { home_widget_id: @user_home_setting.home_widget_id, position: @user_home_setting.position, user_id: @user_home_setting.user_id, visibility: @user_home_setting.visiblity } }
    end

    assert_redirected_to user_home_setting_url(UserHomeSetting.last)
  end

  test "should show user_home_setting" do
    get user_home_setting_url(@user_home_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_home_setting_url(@user_home_setting)
    assert_response :success
  end

  test "should update user_home_setting" do
    patch user_home_setting_url(@user_home_setting), params: { user_home_setting: { home_widget_id: @user_home_setting.home_widget_id, position: @user_home_setting.position, user_id: @user_home_setting.user_id, visibility: @user_home_setting.visiblity } }
    assert_redirected_to user_home_setting_url(@user_home_setting)
  end

  test "should destroy user_home_setting" do
    assert_difference('UserHomeSetting.count', -1) do
      delete user_home_setting_url(@user_home_setting)
    end

    assert_redirected_to user_home_settings_url
  end
end
