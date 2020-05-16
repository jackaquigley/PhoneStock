require_relative('../db/sql_runner')

class Phone

  attr_accessor :name, :storage, :colour
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @storage = options['storage']
    @colour = options['colour']
  end

  def save()
    sql = "INSERT INTO phones
    (
      name,
      storage,
      colour
    )
    VALUES
    (
      $1,
      $2,
      $3
    )
    RETURNING id"
    values = [@name, @storage, @colour]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  def self.all()
    sql = "SELECT * FROM phones"
    phone_data = SqlRunner.run(sql)
    phones = map_items(phone_data)
    return phones
  end

  def delete()
    sql = "DELETE FROM phones where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM phones WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    phone = Phone.new(result)
    return phone
  end

  def self.map_items(phone_data)
    return phone_data.map {
      |phone| Phone.new(phone)}
  end

  def self.delete_all()
    sql = "DELETE FROM phones"
    SqlRunner.run (sql)
  end

end
