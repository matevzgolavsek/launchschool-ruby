require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    cash_register = CashRegister.new(1000)
    transaction = Transaction.new(20)

    transaction.amount_paid = 20

    previous_amount = cash_register.total_money
    cash_register.accept_money(transaction)
    new_amount = cash_register.total_money

    assert_equal previous_amount + 20, new_amount
  end

  def test_change
    cash_register = CashRegister.new(1000)
    transaction = Transaction.new(20)

    transaction.amount_paid = 50

    assert_equal 30, cash_register.change(transaction)
  end

  def test_give_receipt
    item_cost = 20
    cash_register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") do 
      cash_register.give_receipt(transaction)
    end
  end
end