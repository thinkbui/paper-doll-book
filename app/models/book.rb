class Book < ApplicationRecord
	validates :name, :presence => true

	has_many :pages
	has_many :book_pages
	has_many :layers
end