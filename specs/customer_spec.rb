require('minitest/autorun')
require('minitest/rg')

require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')


class CustomerTest < Minitest::Test

  def setup
     @customer1 = Customer.new({'name' => 'Porter Morisson', 'funds' => 40})
     @customer2 = Customer.new({'name' => 'Barry Cruz', 'funds' => 5})
     @customer3 = Customer.new({'name' => 'Ruiz Cruz', 'funds' => 60})

     @film1 = Film.new({'title' => 'Iron Man', 'price' => 10})
     @film2 = Film.new({'title' => 'Spider Man', 'price' => 15})
     @film3 = Film.new({'title' => 'Incredibles', 'price' => 20})

     # @ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
  end

  def test_buy_ticket_decrease_customer_funds()
     @customer1.buy_ticket(@film1)
     assert_equal(30, @customer1.funds)
   end

   def test_buy_ticket_decrease_customer_funds_not_enough_money()
      @customer2.buy_ticket(@film1)
      assert_equal(5, @customer2.funds)
    end


end
