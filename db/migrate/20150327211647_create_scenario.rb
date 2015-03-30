class CreateScenario < ActiveRecord::Migration
  def self.up
    create_table :scenarios do |t|
      t.column      :round_of_1_ids, "int[]"
      t.column      :round_of_2_ids, "int[]"
      t.column      :round_of_4_ids, "int[]"
      t.column      :round_of_8_ids, "int[]"
      t.column      :round_of_16_ids, "int[]"
      t.column      :round_of_32_ids, "int[]"
      t.integer     :winner_id
      t.timestamps
    end
  end

  def self.down
    drop_table :scenarios
  end
end
