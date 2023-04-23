require "test_helper"

class Admin::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cart_items_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_cart_items_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_cart_items_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_cart_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_cart_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_cart_items_update_url
    assert_response :success
  end
end
