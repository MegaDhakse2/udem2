require "test_helper"

class ListUserTest < ActionDispatch::IntegrationTest
  setup do
    @user =
      User.create(
        username: "mega",
        email: "mega@gmail.com",
        password: "Mega@123"
      )
    @user2 =
      User.create(username: "meg", email: "meg@gmail.com", password: "Meg@123")
  end

  test "listing users " do
    get users_path
    assert_select "a[href=?]", user_path(@user), text: "View profile"
    assert_select "a[href=?]", user_path(@user2)
  end
end
