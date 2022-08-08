require 'minitest/autorun'
require_relative './password_validator'
require_relative './password_validation_error'

class PasswordValidatorTest < MiniTest::Test
  def test_valid_password
    password = '0123456ABCD'
    assert PasswordValidator.new(password).validate!
  end

  def test_lenght_too_small
    password = '01234567'
    assert_raises(PasswordValidationError) { PasswordValidator.new(password).validate! }
  end

  def test_lenght_too_big
    password = '01234567890123456'
    assert_raises(PasswordValidationError) { PasswordValidator.new(password).validate! }
  end

  def test_inclusion_of_3_numbers_invalid
    password = 'abcdefghijk'
    assert_raises(PasswordValidationError) { PasswordValidator.new(password).validate! }
  end

  def test_4_uppercase_characteracters_invalid
    password = '0123456abcd'
    assert_raises(PasswordValidationError) { PasswordValidator.new(password).validate! }
  end
end