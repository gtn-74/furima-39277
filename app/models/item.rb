class Item < ApplicationRecord
  
  belongs_to :user

  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :sale_id, presence: true
  validates :prefecture_id, presence: true
  validates :shopping_id, presence: true
  validates :price, presence: true

  
end
