require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers
      (name, funds)
      VALUES
      ($1, $2) RETURNING *"
    values = [@name, @funds]
    customers = SqlRunner.run(sql, values).first
    @id = customers['id'].to_i
  end

  def films()
    sql = " SELECT films.* FROM customers
        INNER JOIN tickets
        ON tickets.customer_id = customers.id
        INNER JOIN films
        ON tickets.film_id = films.id
        WHERE customers.id = $1"
    values = [@id]
    films = SqlRunner.run( sql, values)
    result = films.map{ |film| Film.new(film) }
    return result
  end

  def tickets()
    sql = "SELECT tickets.* FROM customers
          INNER JOIN tickets
          ON tickets.customer_id = customers.id
          INNER JOIN films
          ON tickets.film_id = films.id
          WHERE customers.id = $1"
    values = [@id]
    tickets = SqlRunner.run( sql , values)
    result = tickets.map{ |ticket| Ticket.new(ticket) }
    return result.count
  end

  def buy_ticket()
    @funds -= price if @funds >= price 
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run( sql, values)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

  def update()
    sql = "UPDATE customers
          SET
          (name, funds)
          =
          ($1, $2)
          WHERE id = $3"
    values = [@name, @funds,@id]
    SqlRunner.run( sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
