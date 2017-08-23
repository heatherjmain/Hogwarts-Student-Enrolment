require_relative('../db/sql_runner')

class Student

  attr_accessor :first_name, :second_name,:house_id, :age
  attr_reader :id

  def initialize(params)
    @id = params["id"].to_i() if params["id"]
    @first_name = params["first_name"]
    @second_name = params["second_name"]
    @house_id = params["house_id"].to_i
    @age = params["age"].to_i
  end

  def save()
    sql = "INSERT INTO students
    ( first_name, second_name, house_id, age)
    VALUES
    ( $1, $2, $3, $4 )
    RETURNING id
    "
    values = [@first_name, @second_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id']
  end

  # def find_house()
  #   house = House.find(@house_id)
  #   return house
  # end

  def update()
    sql = "UPDATE students
    SET (first_name, second_name, house_id, age)
    = ($1, $2, $3, $4)
    WHERE id = $5
    "
    values = [@first_name, @second_name, @house_id, @age, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM students
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM students"
    values = []
    students = SqlRunner.run( sql, values )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students
    WHERE id = $1
    "
    values = [id]
    students = SqlRunner.run( sql, values ).first
    result = Student.new( students )
    return result
  end


  def find_house()
    sql = "SELECT * FROM houses
    WHERE id = $1
    "
    values = [@house_id]
    house_object = SqlRunner.run(sql, values)
    house = House.new( house_object.first )
    return house
  end
end
