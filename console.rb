require_relative('models/customer')

require('pry-byebug')

Customer.delete_all()

customer1 = Customer.new({'name' => 'Porter Morisson', 'funds' => 100})
customer1.save
customer2 = Customer.new({'name' => 'Barry Cruz', 'funds' => 50})
customer2.save
customer3 = Customer.new({'name' => 'Ruiz Reid', 'funds' => 10})
customer3.save
customer4 = Customer.new({'name' => 'Bradley Scott', 'funds' => 600})
customer4.save


binding.pry
nil
