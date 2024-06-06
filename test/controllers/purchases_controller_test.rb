require "test_helper"

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchases_index_url
    assert_response :success
  end

  test "should get show" do
    get purchases_show_url
    assert_response :success
  end

  test "should get new" do
    get purchases_new_url
    assert_response :success
  end

  test "should get create" do
    get purchases_create_url
    assert_response :success
  end

  test "should get edit" do
    get purchases_edit_url
    assert_response :success
  end

  test "should get update" do
    get purchases_update_url
    assert_response :success
  end

  test "should get destroy" do
    get purchases_destroy_url
    assert_response :success
  end
end
