class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :item_name, :description ,:price, :image
  end
    
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id
  end

end
