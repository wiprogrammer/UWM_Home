require "application_system_test_case"

class UserHomeSettingsTest < ApplicationSystemTestCase
  setup do
    @user_home_setting = user_home_settings(:one)
  end

  test "visiting the index" do
    visit user_home_settings_url
    assert_selector "h1", text: "User Home Settings"
  end

  test "creating a User home setting" do
    visit user_home_settings_url
    click_on "New User Home Setting"

    fill_in "Home Widget", with: @user_home_setting.home_widget_id
    fill_in "Position", with: @user_home_setting.position
    fill_in "User", with: @user_home_setting.user_id
    fill_in "Visibility", with: @user_home_setting.visibility
    click_on "Create User home setting"

    assert_text "User home setting was successfully created"
    click_on "Back"
  end

  test "updating a User home setting" do
    visit user_home_settings_url
    click_on "Edit", match: :first

    fill_in "Home Widget", with: @user_home_setting.home_widget_id
    fill_in "Position", with: @user_home_setting.position
    fill_in "User", with: @user_home_setting.user_id
    fill_in "Visibility", with: @user_home_setting.visibility
    click_on "Update User home setting"

    assert_text "User home setting was successfully updated"
    click_on "Back"
  end

  test "destroying a User home setting" do
    visit user_home_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User home setting was successfully destroyed"
  end
end
