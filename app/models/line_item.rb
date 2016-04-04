class LineItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :item
  validates :list, presence: true
  validates :item, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
