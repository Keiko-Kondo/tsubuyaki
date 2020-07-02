require 'test_helper'

class SaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @say = says(:one)
  end

  test "should get index" do
    get says_url
    assert_response :success
  end

  test "should get new" do
    get new_say_url
    assert_response :success
  end

  test "should create say" do
    assert_difference('Say.count') do
      post says_url, params: { say: {  } }
    end

    assert_redirected_to say_url(Say.last)
  end

  test "should show say" do
    get say_url(@say)
    assert_response :success
  end

  test "should get edit" do
    get edit_say_url(@say)
    assert_response :success
  end

  test "should update say" do
    patch say_url(@say), params: { say: {  } }
    assert_redirected_to say_url(@say)
  end

  test "should destroy say" do
    assert_difference('Say.count', -1) do
      delete say_url(@say)
    end

    assert_redirected_to says_url
  end
end
