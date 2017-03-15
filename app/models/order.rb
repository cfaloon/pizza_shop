class Order < ActiveRecord::Base
  enum status: [:draft, :placed, :complete]
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
    return true unless delivery? # return immediately if this is a delivery, no address required.
    return false unless address # reject validation if the address is completely nil and this is a delivery
    %i(line_1 line_2 city state zip).all? { |key| address.key?(key) && address[key].present? }
  end
end
