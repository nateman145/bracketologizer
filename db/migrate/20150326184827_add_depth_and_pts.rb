class AddDepthAndPts < ActiveRecord::Migration

  def self.up
    SqlUtils.exec <<-EOSQL
      ALTER TABLE bracket_nodes ADD COLUMN depth int
    EOSQL
    SqlUtils.exec <<-EOSQL
      ALTER TABLE bracket_nodes ADD COLUMN pts int
    EOSQL
    SqlUtils.exec <<-EOSQL
      ALTER TABLE brackets ADD COLUMN total_pts int
    EOSQL
    SqlUtils.exec <<-EOSQL
      ALTER TABLE brackets ADD COLUMN possible_pts int
    EOSQL
  end

  def self.down
    SqlUtils.exec <<-EOSQL
      ALTER TABLE bracket_nodes DROP COLUMN depth
    EOSQL
    SqlUtils.exec <<-EOSQL
      ALTER TABLE bracket_nodes DROP COLUMN pts
    EOSQL
    SqlUtils.exec <<-EOSQL
      ALTER TABLE brackets DROP COLUMN total_pts
    EOSQL
    SqlUtils.exec <<-EOSQL
      ALTER TABLE brackets DROP COLUMN possible_pts
    EOSQL
  end
end
