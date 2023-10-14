require "test_helper"

class CookingRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cooking_records_create_url
    assert_response :success
  end

  test "should get finish" do
    get cooking_records_finish_url
    assert_response :success
  end
end
