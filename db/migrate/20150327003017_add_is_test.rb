class AddIsTest < ActiveRecord::Migration

  def self.up
    SqlUtils.exec <<-EOSQL
      ALTER TABLE bracket_nodes ADD COLUMN is_test boolean
    EOSQL
  end

  def self.down
    SqlUtils.exec <<-EOSQL
      ALTER TABLE bracket_nodes DROP COLUMN boolean
    EOSQL
  end
end
