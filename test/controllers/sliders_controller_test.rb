require 'test_helper'

class SlidersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sliders_index_url
    assert_response :success
  end

  test "should get new" do
    get sliders_new_url
    assert_response :success
  end

  test "should get create" do
    get sliders_create_url
    assert_response :success
  end

  test "should get show" do
    get sliders_show_url
    assert_response :success
  end

  test "should get edit" do
    get sliders_edit_url
    assert_response :success
  end

  test "should get update" do
    get sliders_update_url
    assert_response :success
  end

  test "should get destroy" do
    get sliders_destroy_url
    assert_response :success
  end

end
