# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

menu_items = [{ name: 'Chicken Supreme Stromboli', description: 'Chicken, bacon, tomatoes, mozzarella, cheddar and ranch.', price: 7.99  },
              { name: 'NY Sausage Stromboli', description: 'Italian sausage, green peppers, pepperoni, mozzarella, and mushroom.', price: 7.99 },
             { name: 'Garlic Knots (6 pc)', description: 'Served with a side of marinara sauce.
', price: 2.99 },
             { name: 'Garlic Knots (12 pc)', description: 'Served with a side of marinara sauce.
', price: 4.99 },
             { name: 'Onion Rings', description: 'Beer battered and deep fried.', price: 2.99 },
             { name: 'Pizza Fries', description: 'French fries topped with marinara sauce and melted mozzarella cheese.', price: 3.95 },
             { name: 'Sampler Plate', description: 'Includes 2 mozzarella sticks, 2 jalapeno poppers, 2 fried mushrooms, 2 onion rings, and 2 fried ravioli.', price: 6.95 },
             { name: 'Side House Salad', description: 'Fresh lettuce, tomatoes, cucumbers and cheese. Side bread not included.
', price: 3.99 },
             { name: 'Chef Salad', description: 'Fresh lettuce, tomatoes, cucumbers, turkey, ham, eggs and cheese.', price: 6.99 },
             { name: 'Ham Sub (8" Small)', description: 'Served with mayonnaise, provolone cheese, lettuce, tomatoes, onions and house vinaigrette dressing.', price: 6.99 },
             { name: 'Ham Sub (12" Large)', description: 'Served with mayonnaise, provolone cheese, lettuce, tomatoes, onions and house vinaigrette dressing.', price: 8.45 },
             { name: 'Turkey and Ham Sub (8" Small)', description: 'Served with mayonnaise, provolone cheese, lettuce, tomatoes, onions and house vinaigrette dressing.', price: 6.99 },
             { name: 'Turkey and Ham Sub (12" Large)', description: 'Served with mayonnaise, provolone cheese, lettuce, tomatoes, onions and house vinaigrette dressing.', price: 8.45 },
             { name: 'Philly Steak Sub (8" Small)', description: 'Thinly sliced seasoned steak grilled with onions, topped with provolone cheese, served with banana peppers, lettuce, tomatoes, mayonnaise and house vinaigrette.', price: 6.99 },
             { name: 'Philly Steak Sub (12" Large)', description: 'Thinly sliced seasoned steak grilled with onions, topped with provolone cheese, served with banana peppers, lettuce, tomatoes, mayonnaise and house vinaigrette.', price: 8.45 },
             { name: 'Chicken Parmigiana Sub (8" Small)', description: 'Served with marinara sauce and mozzarella cheese.', price: 6.99 },
             { name: 'Chicken Parmigiana Sub (12" Large)', description: 'Served with marinara sauce and mozzarella cheese.', price: 8.45 },
             { name: 'Stuffed Meat Pizza (14" Small)', description: 'Ham, pepperoni, sausage and meatballs. No pizza sauce.', price: 18.95 },
             { name: 'Stuffed Meat Pizza (18" Large)', description: 'Ham, pepperoni, sausage and meatballs. No pizza sauce.', price: 24.95 },
             { name: 'Rio Rancho Pizza (14" Small)', description: 'Bacon, tomatoes and ranch dressing. No pizza sauce.
', price: 14.95 },
             { name: 'Rio Rancho Pizza (18" Large)', description: 'Bacon, tomatoes and ranch dressing. No pizza sauce.', price: 24.95 },]
MenuItem.create menu_items
