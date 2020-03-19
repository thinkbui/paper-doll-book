class Book < ApplicationRecord
	validates :name, :presence => true

	has_many :pages
	has_many :book_pages
end