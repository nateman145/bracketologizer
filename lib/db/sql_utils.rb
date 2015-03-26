module SqlUtils
  def self.connection
    ActiveRecord::Base.connection
  end

  def self.execute_to_array query
    results = connection.execute(query)
    results.to_a
  end

  def self.exec query
    connection.execute(query)
  end
end