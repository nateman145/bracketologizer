class Scenario < ActiveRecord::Base
  belongs_to :winning_team, :class_name => "Team", :foreign_key => "winning_team_id"

  attr_accessible :round_of_1_ids,:round_of_2_ids,:round_of_4_ids,:round_of_8_ids,:round_of_16_ids,:round_of_32_ids

end
