var order = { delivery: false, status: 0, order_items: [] };

function setUserId(userId) {
  order.user_id = userId;
  console.log(order);
  console.log(userId);
};

function addItemToOrder(menuItemId, price) {
  order.order_items.push({ menu_item_id: menuItemId, price: price });
  console.log(order);
};
