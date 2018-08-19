require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films
          (title, price)
          VALUES
          ($1, $2) RETURNING *"
    values = [@title, @price]
    movies = SqlRunner.run(sql, values).first
    @id = movies['id'].to_i
  end

  def customers()
    sql = " SELECT customers.* FROM films
        INNER JOIN tickets
        ON tickets.film_id = films.id
        INNER JOIN customers
        ON tickets.customer_id = customers.id
        WHERE films.id = $1"
    values = [@id]
    customers = SqlRunner.run( sql, values)
    result = customers.map{ |customer| Customer.new(customer) }
    return result
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    movies = SqlRunner.run( sql, values)
    result = movies.map {|movie| Film.new(movie)}
    return result
  end

  def update()
    sql = "UPDATE films
          SET
          (title, price)
          =
          ($1, $2)
          WHERE id = $3"
    values = [@title, @price,@id]
    SqlRunner.run( sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end
end
