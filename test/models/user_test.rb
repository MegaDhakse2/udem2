require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user =
      User.new(
        username: "spain",
        email: "sp@gmail.com",
        password_digest: "Spain@123"
      )
  end

  test " all " do
    assert @user.valid?
  end

  test "username shouldn't be null" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should be unique" do
    @user.save
    @user2 = User.new(username: "spain")
    assert_not @user2.valid?
  end

  test "username is too short" do
    @size = @user.username.size
    assert @size > 3
  end

  test "username is too long" do
    @size = @user.username.size
    assert @size < 15
  end
end
