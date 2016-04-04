class Item < ActiveRecord::Base
  has_many :line_items
  validates :name, presence: true, length: { minimum: 1, maximum: 140 }
  validates :barcode, presence: true, length: { minimum: 1 }
end
