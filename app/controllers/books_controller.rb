class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @books = Book.all
    authorize @books
  end

  def show
    # authorize @book
  end

  def new
    @book = current_user.books.build
    authorize @books
  end

  def edit
    # authorize @book
  end

  def create
    @book = current_user.books.build(book_params)
    authorize @book

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    # authorize @book
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    # authorize @book

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
    authorize @book
  end

  def book_params
    params.require(:book).permit(:title, :user_id)
  end
end
