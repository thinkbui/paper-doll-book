class LayerSerializer < ActiveModel::Serializer
  attributes :controls, :current, :display, :name

  def controls
    self.object.get_control_name
  end
end
