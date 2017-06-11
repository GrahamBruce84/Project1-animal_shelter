require_relative '../db/sql_runner'

class Adoption

  attr_accessor :id, :animal_id, :owner_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @animal_id = options['animal_id'].to_i()
    @owner_id = options['owner_id'].to_i()
  end

  def save()
    sql = "INSERT INTO adoptions (animal_id, owner_id)
    VALUES ('#{@animal_id}', '#{@owner_id}')
    RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    result = SqlRunner.run(sql)
    return result.map {|adopt| Adoption.new(adopt)}
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return Adoption.new(result[0])
  end

  def animal()
    sql = " SELECT * FROM animals a
            INNER JOIN adoptions ad
            ON ad.animal_id = a.id
            WHERE a.id = #{@animal_id};"
    result = SqlRunner.run(sql)
    return Adoption.new(result[0])
  end

  def owner()
    sql = " SELECT * FROM owners o
            INNER JOIN adoptions ad
            ON ad.owner_id = o.id
            WHERE o.id = #{@owner_id};"
    result = SqlRunner.run(sql)
    return Adoption.new(result[0])
  end

  def self.delete()
    sql = "DELETE FROM adoptions WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end