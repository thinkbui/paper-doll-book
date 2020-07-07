class Layer < ApplicationRecord
	validates :name, :presence => true
	validates :iid, :presence => true
	validates :book_id, :presence => true

	belongs_to :book
	belongs_to :page, optional: true

  CONTROLS = ['hidden','toggle','select']

  def get_control_name
    CONTROLS[controls] || CONTROLS[0]
  end
end