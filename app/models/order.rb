class Order < ActiveRecord::Base
  # relations
  belongs_to :user
  has_many :order_items
  has_many :menu_items, through: :order_items
  # validations
  validate :address_format
       
  accepts_nested_attributes_for :order_items

  def subtotal
    menu_items.map(&:price).reduce(&:+)
  end

  private
  def address_format
    return true unless delivery
    %s(line_1 line_2 city state zip).all? { |key| address.key? key && address[key] }
  end
end
