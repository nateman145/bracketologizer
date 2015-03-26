class AddIsAliveToTeams < ActiveRecord::Migration

  def self.up
    SqlUtils.exec <<-EOSQL
      ALTER TABLE teams ADD COLUMN is_alive boolean DEFAULT true
    EOSQL
  end

  def self.down
    SqlUtils.exec <<-EOSQL
      ALTER TABLE teams DROP COLUMN is_alive
    EOSQL
  end
end
