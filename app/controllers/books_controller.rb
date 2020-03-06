class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.name = params[:book][:name]
    @book.description = params[:book][:description]
    @book.save!
    redirect_to action: "show", id: @book.id
  end
end