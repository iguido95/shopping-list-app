class List < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :name, presence: true, length: { minimum: 1, maximum: 140 } 
end
