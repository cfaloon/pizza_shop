var order = { delivery: false, status: 'draft', order_items_attributes: [] };

function setUserId(userId) {
  order.user_id = userId;
};

function addItemToOrder(menuItemId, name, price) {
  var orderItem =  { menu_item_id: menuItemId, name: name, price: price };
  order.order_items_attributes.push(orderItem);
  addRowToCart(orderItem);
};

function addRowToCart(orderItem) {
  var index = $('#cart-table tbody tr').length;
  $('#cart-table tbody').append('<tr data-id="' + orderItem.menu_item_id + '"><td>' + orderItem.name + '</td><td>$' + orderItem.price + '</td><td><button class="btn" onclick="removeItem(this)">&times;</button></td>' + '</tr>');
  updateSubtotal();
};

function removeRowFromCart(row) {
  $(row).closest('tr').remove();
  updateSubtotal();
};

function updateSubtotal() {
  var subtotal = computeSubtotal();
  $('#cart-subtotal').html('$' + subtotal);
};

function computeSubtotal() {
  var subtotal = order.order_items_attributes.reduce(function(acc, order_item) {
    return acc + order_item.price;
  }, 0);
  return Math.round(subtotal * 100) / 100;
};
function removeItem(row) {
  var orderItemId = $(row).data('id');
  var orderItem = order.order_items_attributes.filter( function(obj) {
    obj.menu_item_id == orderItemId ? true : false;
  })[0];
  var index = order.order_items_attributes.indexOf(orderItem);
  order.order_items_attributes.splice(index, 1);
  removeRowFromCart(row);
};

function finalizeOrder() {
  // build the final order
  $('#final-order tbody').empty();
  order.order_items_attributes.forEach( function(orderItem) {
    $('#final-order tbody').append('<tr data-id="' + orderItem.menu_item_id + '"><td>' + orderItem.name + '</td><td>$' + orderItem.price + '</td></tr>');
  });
  $('#final-subtotal').html('$' + computeSubtotal());
  order.delivery = $("#delivery").prop('checked');
  openModal();
};

function submitOrder() {
  var address = {};
  var addressInputs = $('#address-form :input');
  addressInputs.each(function () {
    address[this.name] = this.value;
  });
  order.address = address;
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

function setCartHeight() {
  console.log('scroll');
  element.css('height', $(window).innerHeight() - (element.offset().top - $(window).scrollTop()) - 20);
};

function openModal() {
  order.delivery ? $('#full-address').show() : $('#full-address').hide();
  $('#delivery-modal').show();
};

function closeModal() {
  $('#delivery-modal').hide();
};
