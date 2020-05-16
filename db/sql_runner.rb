require('pg')

class SqlRunner

  def self.run(sql, values = [])
    db = PG.connect({dbname: 'phones', host:'localhost'})
    db.prepare("query", sql)
    result = db.exec_prepared("query", values)
  ensure
    db.close() if db != nil
  end
    return result
  end
end
