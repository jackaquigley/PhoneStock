require_relative('../db/sql_runner')

class Phone

  attr_accessor :name, :brand, :storage, :colour, :buy_price, :sell_price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @brand = options['brand']
    @storage = options['storage']
    @colour = options['colour']
    @buy_price = options['buy_price']
    @sell_price = options['sell_price']
  end

  def save()
    sql = "INSERT INTO phones
    (
      name,
      brand,
      storage,
      colour,
      buy_price,
      sell_price
    )
    VALUES
    (
      $1,
      $2,
      $3,
      $4,
      $5,
      $6
    )
    RETURNING id"
    values = [@name, @brand, @storage, @colour, @buy_price, @sell_price]
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

  def update()
    sql = "UPDATE phones
    SET
    (
      name,
      brand,
      storage,
      colour,
      buy_price,
      sell_price
      ) =
      (
        $1, $2, $3, $4, $5, $6
      )
      where id = $7"
      values = [@name, @storage, @colour, @buy_price, @sell_price, @id]
      SqlRunner.run(sql, values)
  end

end
