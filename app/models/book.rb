class Book < ApplicationRecord
	validates :name, :presence => true

	has_many :pages
	has_many :book_pages
	has_many :layers

  def book_pages_serialized_as_json
    BookPage.serialized_as_json(book_pages)
  end

  def layers_serialized_as_json
    Layer.serialized_as_json(layers)
  end
end