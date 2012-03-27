require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  setup do
    @new_reservation = Factory.build(:reservation)
  end
  
  test "should not save reservation without a book_id" do
    @new_reservation.book_id = nil
    assert @new_reservation.invalid?
    assert @new_reservation.errors[:book_id].any?
    assert !@new_reservation.save
  end
  
  test "should not save reservation with invalid state" do
    @new_reservation.save
    @new_reservation.state = 'invalid'
    assert !@new_reservation.save
    assert @new_reservation.errors[:state].any?
  end
  
  test "should not save with empty email" do
    @new_reservation.email = nil
    assert !@new_reservation.save
    assert @new_reservation.errors[:email].any?
  end

  test "should not save with invalid email" do
    @new_reservation.email = 'invalid@e'
    assert !@new_reservation.save
    assert @new_reservation.errors[:email].any?
  end
  
  test "should not allow reservation if the book already reserved" do
    reservation = Factory(:reservation, state: 'reserved')
    copy = Reservation.new(reservation.attributes)
    assert !copy.save
    assert_match /book has been already reserved/, copy.errors[:book_id].join
  end
  
  test "should be initially reserved" do
    assert @new_reservation.save
    assert_equal 'reserved', @new_reservation.state
  end

end
