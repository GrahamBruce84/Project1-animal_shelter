require_relative '../db/sql_runner'

class Animal

  attr_accessor :id, :name, :age, :type, :breed, :admission_date

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @age = options['age']
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
  end

  def save()
    sql = "INSERT INTO animals (name, age, type, breed, admission_date)
    VALUES ('#{@name}', #{@age}, '#{type}', '#{@breed}', '#{@admission_date}')
    RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM animals;"
    result = SqlRunner.run(sql)
    return result.map {|animal| Animal.new(animal)}
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return Animal.new(result[0])
  end

  def update()
    sql = "UPDATE animals SET (name, age, type, breed, admission_date) = 
    ('#{@name}', #{@age}, '#{@type}', '#{@breed}', '#{@admission_date}')
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete()
    sql = "DELETE FROM animals WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end