class CreateLayer < ActiveRecord::Migration[6.0]
  def change
    create_table :layers do |t|
      t.references :book, index: true, foreign_key: true, null: false
      t.references :page, index: true, foreign_key: true
      t.string :iid, null: false
      t.string :name, null: false
      t.integer :controls
      t.boolean :display
      t.integer :current
      t.timestamps
    end
  end
end
