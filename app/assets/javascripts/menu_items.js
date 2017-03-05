var order = { delivery: false, status: 0, order_items: [] };

function setUserId(userId) {
  order.user_id = userId;
};

function addItemToOrder(menuItemId, name, price) {
  order.order_items.push({ menu_item_id: menuItemId, name: name, price: price });
  buildCartHtml();
};

function buildCartHtml() {
  var cart = $('#cart');
  var html = $('<ul></ul>');
  order.order_items.forEach( function(orderItem, index, arr) {
    html.append('<li>' + orderItem.name + ' - $' + orderItem.price + ' <a onclick="removeItem(' + index + ')">X</a>' + '</li>');
  });
  var subtotal = order.order_items.reduce(function(acc, order_item) {
    return acc + order_item.price;
  }, 0);
  console.log(subtotal);
  html.append('<span>Subtotal: ' + subtotal  + '</span>');
  cart.html(html);    
};

function removeItem(index) {
  order.order_items.splice(index, 1);
  buildCartHtml();
};
