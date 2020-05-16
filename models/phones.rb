require_relative('../db/sql_runner')

class Phone

  attr_reader :id
  attr_accessor :name, :storage, :colour, :networks

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @storage = options['storage']
    @colour = options['colour']
  end

  def save()
    sql = "INSERT INTO Phones
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
    RETURNING ID"
    values = [@name, @storage, @colour]
    id = result.first['id']
    @id = id.to_i
  end

end
