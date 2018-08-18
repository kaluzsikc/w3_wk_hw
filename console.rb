require_relative('models/customer')

require('pry-byebug')

customer1 = Customer.new({'name' => 'Porter Morisson', 'funds' => 100})
customer2 = Customer.new({'name' => 'Barry Cruz', 'funds' => 50})
customer3 = Customer.new({'name' => 'Ruiz Reid', 'funds' => 10})
customer4 = Customer.new({'name' => 'Bradley Scott', 'funds' => 600})



binding.pry
nil
