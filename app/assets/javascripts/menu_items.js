var order = { delivery: false, status: 0, order_items: [] };

function setUserId(userId) {
  order.user_id = userId;
};

function addItemToOrder(menuItemId, price) {
  order.order_items.push({ menu_item_id: menuItemId, price: price });
  buildCartHtml();
};

function buildCartHtml() {
  var cart = $('#cart');
  var html = $('<ul></ul>');
  order.order_items.forEach( function(order) {
    html.append('<li>' + order.menu_item_id + ' - $' + order.price + '</li>');
  });
  cart.html(html);    
};
