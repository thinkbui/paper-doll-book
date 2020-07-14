class LayerPage < Page
  validates :name, :presence => true
  validates :book_id, :presence => true

  belongs_to :book
  belongs_to :layer

  def self.serialized_as_json(layer_pages)
    ActiveModelSerializers::SerializableResource.new(layer_pages, each_serializer:LayerPageSerializer).as_json
  end

  def layers
    book.layers.where("page_id = ?", self.id)
  end
end
