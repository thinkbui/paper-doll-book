RSpec.describe BookPagesController, type: :controller do
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
      book_page = BookPage.new(name:"Test Page", order: 0, book: book)
      book_page.save!
      get :show, params: {id: book_page.id, book_id: book.id}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      book = Book.new(name:"Test")
      book.save!
      book_page = BookPage.new(name:"Test Page", order: 0, book: book)
      book_page.save!
      get :edit, params: {id: book_page.id, book_id: book.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    before(:each) do
      @book = Book.new(name:"Text")
      @book.save!
      @new_name = "Test Page"
      @params = {book_id: @book.id, book_page: {name: @new_name}}
    end

    it "returns a redirect response" do
      post :create, params: @params
      expect(response.status).to eq(302)
    end

    it "creates a new record" do
      expect{
        post :create, params: @params
      }.to change(BookPage.all,:count).by(1)
    end
  end

  describe "PUT #update" do
    before(:each) do
      @book = Book.new(name: "Text")
      @book.save!
      @book_page = BookPage.new(book: @book, name: "Test Page")
      @book_page.save!
      @new_name = "Test Change"
      @params = {id: @book_page.id, book_id: @book.id, book_page: {name: @new_name}}
    end

    it "returns a redirect response" do
      put :update, params: @params
      expect(response.status).to eq(302)
    end

    it "updates the record" do
      put :update, params: @params
      @book_page.reload
      expect(@book_page.name).to eq(@new_name)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @book = Book.new(name: "Text")
      @book.save!
      @book_page = BookPage.new(name: "Test Page", book: @book)
      @book_page.save!
      @params = {id: @book_page.id, book_id: @book.id}
    end

    it "returns a redirect response" do
      delete :destroy, params: @params
      expect(response.status).to eq(302)
    end

    it "destroys the record" do
      expect{
        delete :destroy, params: @params
      }.to change(BookPage.all,:count).by(-1)
    end
  end
end
