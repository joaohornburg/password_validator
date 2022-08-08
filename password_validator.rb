# The length of the string must be between 10 and 15 characters.
# The string must include at least 3 numbers.
# The string must include at least 4 uppercase characters.

class PasswordValidator
  INVALID_LENGTH_MESSAGE = 'The length of the input must be between 10 and 15 characters.'.freeze
  DOES_NOT_INCLUDE_3_NUMBERS_MESSAGE = 'The input must include at least 3 numbers.'.freeze
  DOES_NOT_INCLUDE_4_UPPERCASE_NUMBERS_MESSAGE = 'The input must include at least 4 uppercase characters'.freeze
  
  def initialize(password)
    # if this grows complex in the future, each validation rule should become a separate class, and be passed to PasswordValidator at instantiation.
    @password = password
  end

  def validate!
    error_messages = []
    error_messages << INVALID_LENGTH_MESSAGE unless lenght_valid?
    error_messages << DOES_NOT_INCLUDE_3_NUMBERS_MESSAGE unless includes_at_least_3_numbers?
    error_messages << DOES_NOT_INCLUDE_4_UPPERCASE_NUMBERS_MESSAGE unless includes_at_least_4_uppercase_chars?
    error_messages.empty? or raise PasswordValidationError.new(error_messages.join(' '))
  end

  private

  def lenght_valid?
    @password.length >= 10 && @password.length <= 15
  end

  def includes_at_least_3_numbers?
    numbers = @password.scan(/(\d)/).flatten.count  >= 3
  end

  def includes_at_least_4_uppercase_chars?
    @password.scan(/([A-Z])/).flatten.count >= 4
  end
end