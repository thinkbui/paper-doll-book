class BookPageSerializer < ActiveModel::Serializer
  attributes :name

  has_many :layer_iids, key: "layers"

  def layer_iids
    object.layers.map{|l| l.iid}
  end
end
