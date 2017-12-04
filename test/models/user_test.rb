require 'test_helper'

class UserTest < ActiveSupport::TestCase
test "should not save user without email"
user= User.new
#assert_not user.save, "Was able to save user without email"
assert user.invalid?
end
