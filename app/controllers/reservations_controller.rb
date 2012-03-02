class ReservationsController < ApplicationController
  
  def new
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.new(params[:reservation])
    if @reservation.save
      flash[:notice] = "Book reserved"
      redirect_to book_path(@book)
    else
      render :new
    end
  end
  
  def free
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.find(params[:id])
   
    if @reservation.free
      flash[:notice] = "Book is no longer reserved"
    else
      flash[:error]  = "Something went wrong"
    end
    redirect_to book_path(@book)
  end
  
end
