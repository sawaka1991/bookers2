class BooksController < ApplicationController
  before_action :authenticate_user!,except: [:top, :about]

  def index
  		@books = Book.page(params[:page]).reverse_order
      @book = Book.new
      @user = current_user
  end

  def about
    
  end

  def new
  		@book = Book.new
  end

  def create
  		@book =Book.new(book_params)
      @book.user_id = current_user.id
      @user = current_user

    if @book.save
  		redirect_to book_path(@book.id), flash: {notice: 'Book was successfully created.'}
    else
      @books =Book.page(params[:page]).reverse_order
      render :index, book: @book, user: @user
    end
  end

  def top
    if user_signed_in?
       redirect_to user_path(current_user)
    end
  end

  def show
      @bookf = Book.new
      @book = Book.find(params[:id])
      @user = @book.user
  end

  def edit
  		@book = Book.find(params[:id])
  end

  def update
  		@book = Book.find(params[:id])
     if @book.update(book_params)
      redirect_to book_path(@book.id), flash: {notice: 'Book was successfully created.'}
    else
      render :edit, book: @book
    end
  end

  def destroy
  		book = Book.find(params[:id])
  		book.destroy
  		redirect_to books_path, flash: {notice: 'Book was successfully destroyed.'}
  end
private

    def book_params
        params.require(:book).permit(:title, :body)

    end
end