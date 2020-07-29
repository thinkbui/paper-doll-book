class LayerPagesController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @layer = @book.layers.find(params[:layer_id])
    @layer_pages = @layer.layer_pages
  end

  def new
    @book = Book.find(params[:book_id])
    @layer = @book.layers.find(params[:layer_id])
    @layer_page = LayerPage.new(book: @book, layer: @layer)
  end

  def show
    @book = Book.find(params[:book_id])
    @layer = @book.layers.find(params[:layer_id])
    @layer_page = @layer.layer_pages.find(params[:id])
  end

  def edit
    @book = Book.find(params[:book_id])
    @layer = @book.layers.find(params[:layer_id])
    @layer_page = @layer.layer_pages.find(params[:id])
  end

  def create
    book = Book.find(params[:book_id])
    layer = book.layers.find(params[:layer_id])
    layer_page = LayerPage.new
    layer_page.book = book
    layer_page.layer = layer
    layer_page.name = params[:layer_page][:name]
    layer_page.order = params[:layer_page][:order]
    layer_page.src = params[:layer_page][:src]
    layer_page.z_index = params[:layer_page][:z_index]
    layer_page.save!
    layer_page.reload
    redirect_to action: "show", id: layer_page.id, book_id: layer_page.book_id, layer_id: layer_page.layer_id
  end

  def update
    layer_page = Book.find(params[:book_id]).layers.find(params[:layer_id]).layer_pages.find(params[:id])
    layer_page.name = params[:layer_page][:name]
    layer_page.order = params[:layer_page][:order]
    layer_page.src = params[:layer_page][:src]
    layer_page.z_index = params[:layer_page][:z_index]
    layer_page.save!
    redirect_to action: "show", id: layer_page.id, book_id: layer_page.book_id
  end

  def destroy
    layer_page = LayerPage.find(params[:id])
    layer_page.destroy!
    redirect_to action: "index"
  end
end
