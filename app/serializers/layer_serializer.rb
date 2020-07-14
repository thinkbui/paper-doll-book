class LayerSerializer < ActiveModel::Serializer
  attributes :controls, :current, :details, :display, :name

  def controls
    self.object.get_control_name
  end

  def details
    LayerPage.serialized_as_json(self.object.layer_pages)
  end
end
