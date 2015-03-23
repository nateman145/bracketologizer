# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def self.connection
    ActiveRecord::Base.connection
  end

  def execute_to_array
    results = connection.execute(query)
    results.to_a
  end
end
