class Book < ApplicationRecord
	validates :name, :presence => true

	has_many :pages
end