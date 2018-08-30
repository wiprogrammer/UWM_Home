require "application_system_test_case"

class HomeWidgetsTest < ApplicationSystemTestCase
  setup do
    @home_widget = home_widgets(:one)
  end

  test "visiting the index" do
    visit home_widgets_url
    assert_selector "h1", text: "Home Widgets"
  end

  test "creating a Home widget" do
    visit home_widgets_url
    click_on "New Home Widget"

    fill_in "Color", with: @home_widget.color
    fill_in "Default Visibility", with: @home_widget.default_visibility
    fill_in "Description", with: @home_widget.description
    fill_in "Link", with: @home_widget.link
    fill_in "Name", with: @home_widget.name
    click_on "Create Home widget"

    assert_text "Home widget was successfully created"
    click_on "Back"
  end

  test "updating a Home widget" do
    visit home_widgets_url
    click_on "Edit", match: :first

    fill_in "Color", with: @home_widget.color
    fill_in "Default Visibility", with: @home_widget.default_visibility
    fill_in "Description", with: @home_widget.description
    fill_in "Link", with: @home_widget.link
    fill_in "Name", with: @home_widget.name
    click_on "Update Home widget"

    assert_text "Home widget was successfully updated"
    click_on "Back"
  end

  test "destroying a Home widget" do
    visit home_widgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Home widget was successfully destroyed"
  end
end
