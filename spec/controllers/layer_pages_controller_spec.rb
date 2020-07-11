RSpec.describe LayerPagesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      book.reload

      layer = Layer.new(name:"Test Layer", book: book, iid: "test_layer")
      layer.save!
      layer.reload

      get :index, params: {book_id: book.id, layer_id: layer.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!

      layer = Layer.new(name:"Test Layer", book: book, iid: "test_layer")
      layer.save!

      get :new, params: {book_id: book.id, layer_id: layer.id}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      layer = Layer.new(name:"Test Layer", book: book, iid: "test_layer")
      layer.save!

      layer_page = LayerPage.new(name:"Test Page", order: 0, book: book, layer: layer)
      layer_page.save!
      get :show, params: {id: layer_page.id, book_id: book.id, layer_id: layer.id}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      layer = Layer.new(name:"Test Layer", book: book, iid: "test_layer")
      layer.save!

      layer_page = LayerPage.new(name:"Test Page", order: 0, book: book, layer: layer)
      layer_page.save!
      get :edit, params: {id: layer_page.id, book_id: book.id, layer_id: layer.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    before(:each) do
      @book = Book.new(name:"Text")
      @book.save!
      @layer = Layer.new(name:"Test Layer", book: @book, iid: "test_layer")
      @layer.save!

      @new_name = "Test Page"
      @params = {book_id: @book.id, layer_id: @layer.id, layer_page: {name: @new_name}}
    end

    it "returns a redirect response" do
      post :create, params: @params
      expect(response.status).to eq(302)
    end

    it "creates a new record" do
      expect{
        post :create, params: @params
      }.to change(LayerPage.all,:count).by(1)
    end
  end

  describe "PUT #update" do
    before(:each) do
      @book = Book.new(name: "Text")
      @book.save!
      @layer = Layer.new(name:"Test Layer", book: @book, iid: "test_layer")
      @layer.save!
      @layer_page = LayerPage.new(book: @book, layer: @layer, name: "Test Page")
      @layer_page.save!
      @new_name = "Test Change"
      @params = {id: @layer_page.id, book_id: @book.id, layer_id: @layer.id, layer_page: {name: @new_name}}
    end

    it "returns a redirect response" do
      put :update, params: @params
      expect(response.status).to eq(302)
    end

    it "updates the record" do
      put :update, params: @params
      @layer_page.reload
      expect(@layer_page.name).to eq(@new_name)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @book = Book.new(name: "Text")
      @book.save!
      @layer = Layer.new(name:"Test Layer", book: @book, iid: "test_layer")
      @layer.save!
      @layer_page = LayerPage.new(name: "Test Page", book: @book, layer: @layer)
      @layer_page.save!
      @params = {id: @layer_page.id, book_id: @book.id, layer_id: @layer.id}
    end

    it "returns a redirect response" do
      delete :destroy, params: @params
      expect(response.status).to eq(302)
    end

    it "destroys the record" do
      expect{
        delete :destroy, params: @params
      }.to change(LayerPage.all,:count).by(-1)
    end
  end
end
