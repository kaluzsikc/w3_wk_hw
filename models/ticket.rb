require_relative("../db/sql_runner")

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets
          (customer_id, film_id)
          VALUES
          ($1, $2) RETURNING *"
    values = [@customer_id, @film_id]
    tickets = SqlRunner.run( sql, values).first
    @id = tickets['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    values = []
    tickets = SqlRunner.run( sql, values)
    result = tickets.map{ |ticket| Ticket.new(ticket) }
    return result
  end
end
