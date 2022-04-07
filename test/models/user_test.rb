require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Test to check the validity preferences for users
  test "invalid if it has no email" do
    user = User.new(password: "123456")
    user.valid?
    assert_not user.errors[:email].empty?
  end

  test "invalid if it has no password" do
    user = User.new(email: "test@test.com")
    user.valid?
    assert_not user.errors[:password].empty?
  end

  test "invalid if the password is shorter than 6 characters" do
    user = User.new(email: "test@test.com", password: "123")
    user.valid?
    assert_not user.errors[:password].empty?
  end

  test "email is unique for each user" do
    User.create(email: "test@test.com", password: "123456")
    user = User.new(email: "test@test.com", password: "123457")
    user.valid?
    assert_not user.errors[:email].empty?
  end
end
