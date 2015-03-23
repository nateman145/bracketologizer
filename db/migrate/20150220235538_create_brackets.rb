class CreateBrackets < ActiveRecord::Migration
  def self.up
    create_table :brackets do |t|
      t.string      :bracket_name
      t.integer     :user_id
      t.boolean     :is_template
      t.integer     :bracket_node_id
      t.timestamps
    end
  end

  def self.down
    drop_table :brackets
  end
end
