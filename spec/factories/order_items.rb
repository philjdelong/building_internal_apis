FactoryBot.define do
  factory :order_item do
    order
    item
    item_price { 1 }
    quantity { 1 }
  end
end
