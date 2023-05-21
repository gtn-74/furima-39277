class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sale
  belongs_to :shopping
  belongs_to :prefecture
  belongs_to :shopping_day

 
  validates :name, :content, presence: true
  validates :category_id, :sale_id, :shopping_id, :prefecture_id, :shopping_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
            format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }


end
