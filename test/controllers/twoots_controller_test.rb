require "test_helper"

class TwootsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twoot = twoots(:one)
  end

  test "should get index" do
    get twoots_url
    assert_response :success
  end

  test "should get new" do
    get new_twoot_url
    assert_response :success
  end

  test "should create twoot" do
    assert_difference('Twoot.count') do
      post twoots_url, params: { twoot: { body: @twoot.body } }
    end

    assert_redirected_to twoot_url(Twoot.last)
  end

  test "should show twoot" do
    get twoot_url(@twoot)
    assert_response :success
  end

  test "should get edit" do
    get edit_twoot_url(@twoot)
    assert_response :success
  end

  test "should update twoot" do
    patch twoot_url(@twoot), params: { twoot: { body: @twoot.body } }
    assert_redirected_to twoot_url(@twoot)
  end

  test "should destroy twoot" do
    assert_difference('Twoot.count', -1) do
      delete twoot_url(@twoot)
    end

    assert_redirected_to twoots_url
  end
end
