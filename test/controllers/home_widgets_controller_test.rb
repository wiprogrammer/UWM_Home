require 'test_helper'

class HomeWidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @home_widget = home_widgets(:one)
  end

  test "should get index" do
    get home_widgets_url
    assert_response :success
  end

  test "should get new" do
    get new_home_widget_url
    assert_response :success
  end

  test "should create home_widget" do
    assert_difference('HomeWidget.count') do
      post home_widgets_url, params: { home_widget: { color: @home_widget.color, default_visibility: @home_widget.default_visibility, description: @home_widget.description, link: @home_widget.link, name: @home_widget.name } }
    end

    assert_redirected_to home_widget_url(HomeWidget.last)
  end

  test "should show home_widget" do
    get home_widget_url(@home_widget)
    assert_response :success
  end

  test "should get edit" do
    get edit_home_widget_url(@home_widget)
    assert_response :success
  end

  test "should update home_widget" do
    patch home_widget_url(@home_widget), params: { home_widget: { color: @home_widget.color, default_visibility: @home_widget.default_visibility, description: @home_widget.description, link: @home_widget.link, name: @home_widget.name } }
    assert_redirected_to home_widget_url(@home_widget)
  end

  test "should destroy home_widget" do
    assert_difference('HomeWidget.count', -1) do
      delete home_widget_url(@home_widget)
    end

    assert_redirected_to home_widgets_url
  end
end
