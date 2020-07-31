class BookPage < Page
	validates :name, :presence => true
	validates :book_id, :presence => true

	belongs_to :book
  has_many :layers, foreign_key: "page_id"

  def self.serialized_as_json(book_pages)
    ActiveModelSerializers::SerializableResource.new(book_pages, each_serializer:BookPageSerializer).as_json
  end

  def url
    Rails.application.routes.url_helpers.book_book_page_path(book,self)
  end
end
