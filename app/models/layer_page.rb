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

  def list_select_name
    "#{layer.iid} (#{layer.name}) #{layer.order} (#{name})"
  end

  def list_select_sorting_order
    [type, layer.iid, order]
  end

  def url
    Rails.application.routes.url_helpers.book_layer_layer_page_path(book,layer,self)
  end
end
