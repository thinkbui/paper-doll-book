class Book < ApplicationRecord
	validates :name, :presence => true

	has_many :pages
	has_many :book_pages
	has_many :layers

  def book_pages_serialized_as_json
    JSON.pretty_generate(BookPage.serialized_as_json(book_pages))
  end

  def layers_serialized_as_json
    JSON.pretty_generate(Layer.serialized_as_json(layers.order(:iid)))
  end

  def pages_list_select_sorted
    pages.sort_by{|page| page.list_select_sorting_order }
  end
end