class CreateBracketNodes < ActiveRecord::Migration
  def self.up
    create_table :bracket_nodes do |t|
      t.integer     :parent_id
      t.integer     :team_id
      t.boolean     :win
      t.timestamps
    end
  end

  def self.down
    drop_table :bracket_nodes
  end
end
