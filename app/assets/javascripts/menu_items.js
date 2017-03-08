var order = { delivery: false, status: 0, order_items_attributes: [] };

function setUserId(userId) {
  order.user_id = userId;
};

function addItemToOrder(menuItemId, name, price) {
  order.order_items_attributes.push({ menu_item_id: menuItemId, name: name, price: price });
  buildCartHtml();
};

function buildCartHtml() {
  var cart = $('#cart');
  if(order.order_items_attributes.length > 0) {
    var html = $('<table></table>');
    html.append('<th>Item</th><th>Price</th><th>Remove</th>');
    order.order_items_attributes.forEach( function(orderItem, index, arr) {
      html.append('<tr><td>' + orderItem.name + '</td><td>$' + orderItem.price + '</td><td><button class="btn" onclick="removeItem(' + index + ')">X</button></td>' + '</tr>');
    });
    var subtotal = order.order_items_attributes.reduce(function(acc, order_item) {
      return acc + order_item.price;
    }, 0);
    html.append('<span class="subtotal">Subtotal: ' + subtotal  + '</span><br />');
    html.append('<button class="btn" onclick="submitOrder();">Place Order</button>');
    console.log(String(html));
  } else {
    html = $('<span>Add items to your order!</span>');
  }
  cart.html(html);    
};

function removeItem(index) {
  order.order_items_attributes.splice(index, 1);
  buildCartHtml();
};

function submitOrder() {
  $.ajax({ url: '/orders.json',
	   type: 'POST',
	   beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
	   data: {order: order},
	   success: function(response) {
	     if(response) {
	       window.location.href = response.url.replace(/\.json/, '');
	     }
	   }});
};



