class Customer
  def place_order
    @order = Order.new
  end
end

class Order
  def initialize
    @meal = MealItem.new
  end

  def to_s
    meal.map(&:to_s).join(', ')
  end

  def total
    total_cost = @burger.cost + @side.cost + @drink.cost
    format("$%.2f", total_cost) # #format formats the cost to two decimal places
  end

  def +(other)
    self.cost + other.cost
  end
end

class MealItem
  def initialize
    @burger = Burger.new
    @side = Side.new
    @drink = Drink.new
  end

  def meal
    [@burger, @side, @drink]
  end

  def to_s
    MealItem::OPTIONS[@option][:name]
  end

  def cost
    self.cost
  end
end

class Burger < MealItem
  OPTIONS = {
    '1' => { name: 'LS Burger', cost: 3.00 },
    '2' => { name: 'LS Cheeseburger', cost: 3.50 },
    '3' => { name: 'LS Chicken Burger', cost: 4.50 },
    '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
  }

  def initialize
    @option = choose_option
  end

  def choose_option
    puts "Please choose a #{self.class} option:"
    puts 'bla' # item_options returns a list of options and prices
                      # for a particular item type
    gets.chomp
  end
end

class Side < MealItem
  OPTIONS = {
    '1' => { name: 'Fries', cost: 0.99 },
    '2' => { name: 'Onion Rings', cost: 1.50 }
  }

  def initialize
    @option = choose_option
  end

  def choose_option
    puts "Please choose a #{self.class} option:"
    # item_options returns a list of options and prices
                      # for a particular item type
    gets.chomp
  end
end

class Drink < MealItem
  OPTIONS = {
    '1' => { name: 'Cola', cost: 1.50 },
    '2' => { name: 'Lemonade', cost: 1.50 },
    '3' => { name: 'Vanilla Shake', cost: 2.00 },
    '4' => { name: 'Chocolate Shake', cost: 2.00 },
    '5' => { name: 'Strawberry Shake', cost: 2.00 }
  }

  def initialize
    @option = choose_option
  end

  def choose_option
    puts "Please choose a #{self.class} option:"
    puts 'bla' # item_options returns a list of options and prices
                      # for a particular item type
    gets.chomp
  end
end


my_order = Order.new
# p my_order
p my_order.total