class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :telephone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :block, :user_id, :item_id, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は「-」(ハイフン)を入れた半角数字で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building,
                   telephone_number: telephone_number, order_id: order.id)
  end
end
