require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  
  setup do
    @book          = books(:steppenwolf)
    @reserved_book = books(:rails_recipes)
    @reservation   = Reservation.create(book: @reserved_book, email: 'library@eficode.com')
  end
  
  test "new reservation" do
    get :new, book_id: @book.id
    assert_response :success
    assert_equal @book, assigns(:book)
    assert assigns(:reservation)
    assert assigns(:reservation).new_record?
  end
  
  test "create reservation with valid parameters" do
    assert_difference("Reservation.count", +1) do
      post :create, book_id: @book.id, reservation: {email: 'library@eficode.com'}
      assert_response :redirect
      assert_redirected_to book_path(@book)
      assert flash[:notice]
    end
  end

  test "create reservation with invalid parameters" do
    post :create, book_id: @book.id, reservation: {email: 'invalid'}
    assert_response :success
    assert assigns(:reservation)
    assert assigns(:reservation).new_record?
    assert_template :new
  end
  
  test "free reservation" do
    put :free, book_id: @reserved_book.id, id: @reservation.id
    assert_response :redirect
    assert_redirected_to book_path(@reserved_book)
    assert_equal 'free', assigns(:reservation).state
    assert flash[:notice]
  end

end
