class Page < ApplicationRecord
  validates :name, :presence => true
  validates :book_id, :presence => true

  belongs_to :book

  default_scope { order(order: :asc) }

  def list_select_name
    name
  end

  def list_select_sorting_order
    [type, nil, order]
  end

  def url
    nil
  end
end
