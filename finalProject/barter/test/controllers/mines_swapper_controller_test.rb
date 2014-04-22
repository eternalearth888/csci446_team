require 'test_helper'

class MinesSwapperControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
