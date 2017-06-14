require_relative '../db/sql_runner'

class Animal

  attr_accessor :id, :name, :age, :type, :breed, :admission_date, :image_url
  attr_writer :adoptable

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @age = options['age']
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @adoptable = options['adoptable']
    
    if options['image_url'].class == String
      @image_url = options['image_url']
    else
      File.open('/Users/grahambruce/codeclan_work/project1/public/uploads/' + options['image_url'][:filename], "w") do |f|
          f.write(options['image_url'][:tempfile].read)
          @image_url = options['image_url'][:filename]
      end
    end
  end

  def save()
    sql = "INSERT INTO animals (name, age, type, breed, admission_date, image_url, adoptable)
    VALUES ('#{@name}', #{@age}, '#{type}', '#{@breed}', '#{@admission_date}', '#{@image_url}', '#{@adoptable}')
    RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM animals;"
    result = SqlRunner.run(sql)
    return result.map {|animal| Animal.new(animal)}
  end

  def self.find_adoptable()
    sql = "SELECT * FROM animals WHERE adoptable = true"
    result = SqlRunner.run(sql)
    return result.map {|animal| Animal.new(animal)}
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return Animal.new(result[0])
  end

  def self.find_type(type)
    sql = "SELECT * FROM animals WHERE type = '#{type}'"
    result = SqlRunner.run(sql)
    return result.map {|animal| Animal.new(animal)}
  end

  def update(options)
     sql = "UPDATE animals SET (name, age, type, breed, admission_date, image_url, adoptable) = ('#{@name}', #{@age}, '#{@type}', '#{@breed}', '#{@admission_date}', '#{@image_url}', #{@adoptable}) RETURNING *;"

    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM animals WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def adoptable()
    if @adoptable == "t"
      return "Ready for a new home"
    else
      return "Still in training/In adoption process"
    end
  end

  def pretty_date()
    return DateTime.parse(@admission_date).strftime("%d/%m/%Y") 
  end 

end