class Page < ApplicationRecord
  validates :name, :presence => true
  validates :book_id, :presence => true

  belongs_to :book

  def list_select_name
    name
  end

  def list_select_sorting_order
    [type, nil, order]
  end
end
