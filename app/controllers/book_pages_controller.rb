class BookPagesController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @book_pages = @book.book_pages
  end

  def new
    @book = Book.find(params[:book_id])
    @book_page = BookPage.new(book: @book)
  end

  def show
    @book = Book.find(params[:book_id])
    @book_page = @book.book_pages.find(params[:id])
  end

  def edit
    @book = Book.find(params[:book_id])
    @book_page = @book.book_pages.find(params[:id])
  end

  def create
    book = Book.find(params[:book_id])
    book_page = BookPage.new
    book_page.book = book
    book_page.name = params[:book_page][:name]
    book_page.order = params[:book_page][:order]
    book_page.save!
    book_page.reload
    redirect_to action: "show", id: book_page.id, book_id: book_page.book_id
  end

  def update
    @book_page = Book.find(params[:book_id]).book_pages.find(params[:id])
    @book_page.name = params[:book_page][:name]
    @book_page.order = params[:book_page][:order]
    @book_page.save!
    redirect_to action: "show", id: @book_page.id, book_id: @book_page.book_id
  end

  def destroy
    @book_page = BookPage.find(params[:id])
    @book_page.destroy!
    redirect_to action: "index"
  end
end
