RSpec.describe LayersController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      book.reload

      get :index, params: {book_id: book.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      get :new, params: {book_id: book.id}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      layer = Layer.new(name:"Test Layer", iid: "test_layer", book: book)
      layer.save!
      get :show, params: {id: layer.id, book_id: book.id}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      layer = Layer.new(name:"Test Page", iid: "test_layer", book: book)
      layer.save!
      get :edit, params: {id: layer.id, book_id: book.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    before(:each) do
      @book = Book.new(name:"Text")
      @book.save!
      @new_name = "Test Page"
      @new_iid = "test_layer"
      @params = {book_id: @book.id, layer: {name: @new_name, iid: @new_iid}}
    end

    it "returns a redirect response" do
      post :create, params: @params
      expect(response.status).to eq(302)
    end

    it "creates a new record" do
      expect{
        post :create, params: @params
      }.to change(Layer.all,:count).by(1)
    end
  end

  describe "PUT #update" do
    before(:each) do
      @book = Book.new(name: "Text")
      @book.save!
      @layer = Layer.new(book: @book, name: "Test Page", iid: "test_layer")
      @layer.save!
      @new_name = "Test Change"
      @iid = "test_layer"
      @params = {id: @layer.id, book_id: @book.id, layer: {name: @new_name, iid: @iid}}
    end

    it "returns a redirect response" do
      put :update, params: @params
      expect(response.status).to eq(302)
    end

    it "updates the record" do
      put :update, params: @params
      @layer.reload
      expect(@layer.name).to eq(@new_name)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @book = Book.new(name: "Text")
      @book.save!
      @layer = Layer.new(name: "Test Page", book: @book, iid: "test_layer")
      @layer.save!
      @params = {id: @layer.id, book_id: @book.id}
    end

    it "returns a redirect response" do
      delete :destroy, params: @params
      expect(response.status).to eq(302)
    end

    it "destroys the record" do
      expect{
        delete :destroy, params: @params
      }.to change(Layer.all,:count).by(-1)
    end
  end
end
