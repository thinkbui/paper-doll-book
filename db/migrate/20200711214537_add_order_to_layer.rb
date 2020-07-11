class AddOrderToLayer < ActiveRecord::Migration[6.0]
  def change
    add_column :layers, :order, :integer
  end
end
