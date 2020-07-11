class LayerPage < Page
  validates :name, :presence => true
  validates :book_id, :presence => true

  belongs_to :book
  belongs_to :layer
end