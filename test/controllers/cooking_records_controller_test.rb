require "test_helper"

class CookingRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post cooking_records_url
    assert_redirected_to root_url
  end

  test "should get finish" do
    patch finish_cooking_record_url cooking_records(:one)
    assert_redirected_to root_url
  end
end
