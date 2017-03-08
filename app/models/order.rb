class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :menu_items, through: :order_items

  accepts_nested_attributes_for :order_items

  def subtotal
    menu_items.map(&:price).reduce(&:+)
  end
end
