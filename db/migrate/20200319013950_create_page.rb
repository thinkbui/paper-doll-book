class CreatePage < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
    	t.references :book, index: true, foreign_key: true, null: false
      t.integer :order
      t.string :type
      t.string :name, null: false
      t.text :src
      t.integer :z_index
    end
  end
end
