class LayersController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @layers = @book.layers
  end

  def new
    @book = Book.find(params[:book_id])
    @layer = Layer.new(book: @book)
  end

  def show
    @book = Book.find(params[:book_id])
    @layer = @book.layers.find(params[:id])
    @page_url = layer_parent_page_url
  end

  def edit
    @book = Book.find(params[:book_id])
    @layer = @book.layers.find(params[:id])
  end

  def create
    book = Book.find(params[:book_id])
    layer = Layer.new
    layer.book = book
    layer.name = params[:layer][:name]
    layer.controls = params[:layer][:controls]
    layer.display = params[:layer][:display]
    layer.page_id = params[:layer][:page_id]
    layer.order = params[:layer][:order]
    layer.iid = params[:layer][:iid]
    layer.current = params[:layer][:current]
    layer.save!
    layer.reload
    redirect_to action: "show", id: layer.id, book_id: layer.book_id
  end

  def update
    @layer = Book.find(params[:book_id]).layers.find(params[:id])
    @layer.name = params[:layer][:name]
    @layer.controls = params[:layer][:controls]
    @layer.display = params[:layer][:display]
    @layer.page_id = params[:layer][:page_id]
    @layer.order = params[:layer][:order]
    @layer.iid = params[:layer][:iid]
    @layer.current = params[:layer][:current]
    @layer.save!
    redirect_to action: "show", id: @layer.id, book_id: @layer.book_id
  end

  def destroy
    @layer = Layer.find(params[:id])
    @layer.destroy!
    redirect_to action: "index"
  end

private

  def layer_parent_page_url
    if @layer.page.nil?
      return nil
    else
      @layer.page.url
    end
  end
end
