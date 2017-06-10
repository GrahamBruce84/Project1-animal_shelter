require_relative '../db/sql_runner'

class Owner

  attr_accessor :id, :first_name, :second_name, :address

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @address = options['address']
  end

  def save()
    sql = "INSERT INTO owners (first_name, second_name, address)
    VALUES ('#{@first_name}', '#{@second_name}', '#{@address}')
    RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM owners;"
    result = SqlRunner.run(sql)
    return result.map {|owner| Owner.new(owner)}
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return Owner.new(result[0])
  end

  def update()
    sql = "UPDATE owners SET (first_name, second_name, address) = 
    ('#{@first_name}', '#{@second_name}', '#{@address}')
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete()
    sql = "DELETE FROM owners WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end