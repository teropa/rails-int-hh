class BooksController < ApplicationController
  
  before_filter :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end
  
  def show
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = "Book created"
      redirect_to books_path
    else
      render action: :new
    end
  end
  
  def edit
  end
  
  def update
    if @book.update_attributes(params[:book])
      flash[:notice] = "Book saved"
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end
  
  def destroy
    @book.destroy
    flash[:notice] = "Book deleted"
    redirect_to books_path
  end
  
  
  private
  
  def find_book
    @book = Book.find(params[:id])
  end

end
