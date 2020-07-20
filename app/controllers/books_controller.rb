class BooksController < ApplicationController
  protect_from_forgery except: :page_contents

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def page_contents
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new
    book.name = params[:book][:name]
    book.description = params[:book][:description]
    book.save!
    book.reload
    redirect_to action: "show", id: book.id
  end

  def update
    @book = Book.find(params[:id])
    @book.name = params[:book][:name]
    @book.description = params[:book][:description]
    @book.save!
    redirect_to action: "show", id: @book.id
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    redirect_to action: "index"
  end
end
