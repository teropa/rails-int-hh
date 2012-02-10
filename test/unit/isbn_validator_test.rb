require 'test_helper'
  
class IsbnValidatorTest < ActiveSupport::TestCase

  test "an ISBN with dashes is valid" do
    v = IsbnValidator.new("951-98548-9-4")
    assert v.valid?
  end
  
  test "an ISBN with whitespace is valid" do
    v = IsbnValidator.new("951 98548 9 4")
    assert v.valid?
  end
  
  test "an empty string is not valid" do
    v = IsbnValidator.new("")
    assert !v.valid?
  end
  
  test "a string with letters other than x is not valid" do
    v = IsbnValidator.new("951-98548-9-p")
    assert !v.valid?
  end
  
  test "a string with 14 digits is not valid" do
    v = IsbnValidator.new("12345678901234")
    assert !v.valid?
  end
  
  
end