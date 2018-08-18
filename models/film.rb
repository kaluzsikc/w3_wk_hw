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

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    movies = SqlRunner.run( sql, values)
    result = movies.map {|movie| Film.new(movie)}
    return result
  end


end
