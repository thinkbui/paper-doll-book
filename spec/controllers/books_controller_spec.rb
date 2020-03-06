RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      get :show, params: {id: book.id}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      get :edit, params: {id: book.id}
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    before(:each) do
      @book = Book.new(name: "Text")
      @book.save!
      @new_name = "Test Change"
      @params = {id: @book.id, book: {name: @new_name}}
    end

    it "returns a redirect response" do
      put :update, params: @params
      expect(response.status).to eq(302)
    end

    it "updates the record" do
      put :update, params: @params
      @book.reload
      expect(@book.name).to eq(@new_name)
    end
  end
end
