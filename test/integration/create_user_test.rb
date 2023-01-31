require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest
  test "get new user form and create user form" do
    get signup_url
    assert_response :success
    assert_difference "User.count", 1 do
      post users_path,
           params: {
             user: {
               username: "name",
               email: "any@gmail.com",
               password: "Name@123"
             }
           }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "name", response.body
  end
end
