class Page < ApplicationRecord
	validates :name, :presence => true
	validates :book_id, :presence => true

	belongs_to :book
end