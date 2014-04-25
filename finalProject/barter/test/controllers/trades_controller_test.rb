require 'test_helper'

class TradesControllerTest < ActionController::TestCase
  setup do
    @trade = trades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trade" do
    assert_difference('Trade.count') do
      post :create, trade: { description: @trade.description, status: @trade.status, user1: @trade.user1, user1_item: @trade.user1_item, user2: @trade.user2, user2_item: @trade.user2_item }
    end

    assert_redirected_to trade_path(assigns(:trade))
  end

  test "should show trade" do
    get :show, id: @trade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trade
    assert_response :success
  end

  test "should update trade" do
    patch :update, id: @trade, trade: { description: @trade.description, status: @trade.status, user1: @trade.user1, user1_item: @trade.user1_item, user2: @trade.user2, user2_item: @trade.user2_item }
    assert_redirected_to trade_path(assigns(:trade))
  end

  test "should destroy trade" do
    assert_difference('Trade.count', -1) do
      delete :destroy, id: @trade
    end

    assert_redirected_to trades_path
  end
end
