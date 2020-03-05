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
end