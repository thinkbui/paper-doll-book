class LayerPageSerializer < ActiveModel::Serializer
  attributes :children, :name, :src, :z_index

  def children
    object.layers.map{|layer| layer.iid}
  end
end
