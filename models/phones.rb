class Phone

  attr_reader :id
  attr_accessor :name, :storage, :colour, :networks

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @storage = options['storage']
    @colour = options['colour']
    @networks = options['networks']
  end

end
