require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

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

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film1.id})
ticket4.save

ticket5 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket6.save()
ticket7 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket7.save()
ticket8 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film2.id})
ticket8.save

ticket9 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
ticket9.save()
ticket10 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
ticket10.save()
ticket11 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket11.save()
ticket12 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film3.id})
ticket12.save


binding.pry
nil
