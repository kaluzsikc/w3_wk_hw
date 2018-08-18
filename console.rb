require_relative('models/customer')
require_relative('models/film')

require('pry-byebug')

Customer.delete_all()

customer1 = Customer.new({'name' => 'Porter Morisson', 'funds' => 100})
customer1.save()
customer2 = Customer.new({'name' => 'Barry Cruz', 'funds' => 50})
customer2.save()
customer3 = Customer.new({'name' => 'Ruiz Reid', 'funds' => 10})
customer3.save()
customer4 = Customer.new({'name' => 'Bradley Scott', 'funds' => 600})
customer4.save()

film1 = Film.new({'title' => 'Iron Man', 'price' => 10})
film1.save()
film2 = Film.new({'title' => 'Spider Man', 'price' => 15})
film2.save()
film3 = Film.new({'title' => 'Incredibles', 'price' => 20})
film3.save()
film4 = Film.new({'title' => 'Skyscraper', 'price' => 30})
film4.save()





binding.pry
nil
