require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  
  test "book listing" do
    get :index
    assert_response :success
    assert assigns(:books)
  end
  
  test "show book" do
    get :show, id: books(:steppenwolf).id

    assert_response :success
    assert assigns(:book)
    assert_equal assigns(:book), books(:steppenwolf)
  end
  
  test "new book" do
    get :new
    assert_response :success
    assert assigns(:book)
    assert assigns(:book).new_record?
  end
  
  test "create book with valid parameters" do
    post :create, book: {title: 'Programming Your Home', authors: 'Mike Riley', isbn: '978-1-93435-690-6'}
    assert_response :redirect
    assert_redirected_to books_path
    assert flash[:notice] 
  end

  test "create book with invalid parameters" do
    post :create, book: {title: 'No such book'}
    assert_response :success
    assert assigns(:book)
    assert assigns(:book).new_record?
    assert_template :new
  end
  
  test "edit book" do
    get :edit, id: books(:steppenwolf).id

    assert_response :success
    assert assigns(:book)
    assert_equal assigns(:book), books(:steppenwolf)
  end

  test "update book with valid parameters" do
    put :update, id: books(:steppenwolf).id,
                 book: {title: 'Programming Your Home',
                        authors: 'Mike Riley',
                        isbn: '978-1-93435-690-6'}
                     
    assert_response :redirect
    assert_redirected_to book_path(books(:steppenwolf))
    assert flash[:notice] 
  end
  
  test "update book with invalid parameters" do
    put :update, id: books(:steppenwolf).id,
                 book: {title: 'Some garbage', isbn: 'invalid'}
    assert_response :success
    assert assigns(:book)
    assert assigns(:book).changed?
    assert_template :edit
  end
  
  test "delete book" do
    book = books(:steppenwolf)
    assert_difference("Book.count", -1) do
      delete :destroy, id: book.id
      assert_response :redirect
      assert_redirected_to books_path
      assert flash[:notice]
    end
  end
  
  test "search by title" do
    get :search, query: 'Rails Recipes'
    assert_response :success
    assert_template :index
    assert assigns(:books).include?(books(:rails_recipes))
  end
  
  test "search by isbn" do
    get :search, query: '978-1-93435-677-7', by: 'isbn'
    assert_response :success
    assert_template :index
    assert assigns(:books).include?(books(:rails_recipes))
  end
  
  test "search by authors" do
    get :search, query: 'Hermann', by: 'authors'
    assert_response :success
    assert_template :index
    assert assigns(:books).include?(books(:steppenwolf))
  end

end
