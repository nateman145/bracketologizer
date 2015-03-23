class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string      :team_name
      t.integer     :seed
      t.string      :region
      t.bolean      :still_alive
      t.timestamps
    end
  end

  def self.down
    drop_table :bracket_nodes
  end
end
