class Layer < ApplicationRecord
  validates :name, :presence => true
  validates :iid, :presence => true
  validates :book_id, :presence => true

  belongs_to :book
  belongs_to :page, optional: true
  has_many :layer_pages

  default_scope { order(order: :asc) }
  scope :ordered_by_iid, -> { reorder(iid: :asc) }
  scope :unused, -> { where(page_id: nil) }

  CONTROLS = ['hidden','toggle','select']

  def self.serialized_as_json(layers)
    layers.map{ |layer| [layer.iid, LayerSerializer.new(layer).as_json]}.to_h
  end

  def get_control_name
    CONTROLS[controls] || CONTROLS[0]
  end
end