class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  validates :name, presence: true, length: { minimum: 1, maximum: 140 }
  validates :barcode, presence: true, length: { minimum: 1 }
end
