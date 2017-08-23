require_relative ('../db/sql_runner')

class House

  attr_accessor :name, :logo
  attr_reader :id

  def initialize(params)
    @id = params["id"].to_i()
    @name = params["name"]
    @logo = params["logo"]
  end

  def save()
    sql = "INSERT INTO houses
    ( name, logo)
    VALUES
    ( $1, $2 )
    RETURNING *
    "
    values = [@name, @logo]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    values = []
    houses = SqlRunner.run( sql, values )
    result = houses.map { |houses| House.new( houses ) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses
    WHERE id = $1
    "
    values = [id]
    houses = SqlRunner.run( sql, values )
    result = House.new( houses.first )
    return result
  end


end
