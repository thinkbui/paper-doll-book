class AddLayerIdToPage < ActiveRecord::Migration[6.0]
  def change
    add_reference :pages, :layer, index: true, foreign_key: true
    add_column :pages, :created_at, :datetime, null: false
    add_column :pages, :updated_at, :datetime, null: false
  end
end
