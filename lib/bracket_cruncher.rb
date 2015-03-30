module BracketCruncher
  def self.calculate_combinations
    ncca_bracket = Bracket.find_by_is_template(true)

    alive_teams = Team.all :conditions => 'is_alive'

    # TODO ensure that the field of is power of 2 or add ability to calculate mid round

    root_node = ncca_bracket.bracket_node

    # find latest filled in leaves
    base_nodes_left = find_latest_filled_in_teams(root_node).sort
    if base_nodes_left.length == 1
      puts "#{base_nodes_left.first.team.team_name} already won!"
      return
    end
    ordered_teams = []
    base_nodes_left.each_with_index {|bn,i| ordered_teams << bn.team}

    field_of = ordered_teams.length

    puts "Teams left #{ordered_teams.map(&:team_name)}"
    puts "Field of #{field_of}"

    @@scenarios = []
    round_of = 1
    ordered_teams.each do |team|
      s = Scenario.create :winning_team => team
      @@scenarios << s
      play_out_scenario s, team, ordered_teams, round_of, field_of
      break
    end

    puts "---"
    @@scenarios.each do |s|
      puts "winner: #{s.winning_team}"
      puts "#{s.round_of_1_ids}"
      puts "#{s.round_of_2_ids}"
      puts "#{s.round_of_4_ids}"
      puts "#{s.round_of_8_ids}"
      puts "#{s.round_of_16_ids}"
      puts "#{s.round_of_32_ids}"
      puts "---"
    end
    nil

    #determine_matchups base_nodes_left
  end

  def self.find_latest_filled_in_teams node
    return node if !node.team.nil? and !node.team.team_name.blank?
    node.children.map do |child|
      find_latest_filled_in_teams child
    end.flatten
  end

  def self.play_out_scenario s, team, ordered_teams, round_of, end_at
    round_teams = s.send("round_of_#{round_of}_ids".to_sym)
    round_teams ||= []
    round_teams << team.team_name
    s.send("round_of_#{round_of}_ids=".to_sym,round_teams)
    return [s] if round_of >= end_at
    next_round_of = round_of*2
    puts "r:#{round_of}"
    sections = []
    ordered_teams.each_slice(ordered_teams.length/2) do |sub_teams|
      sections << sub_teams
    end

    all_scenarios = []
    sections.each_with_index do |sub_teams,i|
      if sub_teams.include? team
        scenarios = play_out_scenario s, team, sub_teams, next_round_of, end_at
        all_scenarios = scenarios.map do |s2|
          i2 = i == 0 ? 1 : 0
          i3 = 0
          other_teams = sections[i2]
          other_teams.map do |t|
            if i3 > 0
              s3 = s2.deep_clone
              @@scenarios = s3
              s4 = play_out_scenario s3, t, other_teams, next_round_of, end_at
            else
              s4 = play_out_scenario s2, t, other_teams, next_round_of, end_at
            end
          end
        end
      end
    end
    return all_scenarios.flatten.compact


    #ordered_teams.each_slice(ordered_teams.length/2) do |sub_teams|
    #  puts "#{sub_teams.map(&:team_name)}"
    #
    #  if sub_teams.include? team
    #    play_out_scenario s, team, sub_teams, next_round_of, end_at
    #  else
    #    sub_teams.each_with_index do |t,i|
    #      if i == 0
    #        play_out_scenario s, t, sub_teams, next_round_of, end_at
    #      else
    #        s2 = s.deep_clone
    #        @@scenarios << s2
    #        play_out_scenario s2, t, sub_teams, next_round_of, end_at
    #      end
    #    end
    #  end
    #end
  end

  def self.determine_matchups array

    super_bracket = []
    while !array.blank?
      matchup = base_nodes_left.slice!(0..1)
      #if matchup.is_a? Array.class... do something
      winners = calculate_matchup matchup
      super_bracket << winners
    end
  end

  def self.calculate_matchup matchup
    matchup.map do |m|
      winning_match = BracketNode.create :team => m.team,
                                         :depth => m.depth+1,
                                         :is_test => true
      matchup.each do |m2|
        sub_match = m2.clone
        sub_match.parent_node = winning_match
      end
      winning_match
    end
  end
end

class Object
  def deep_clone
    return @deep_cloning_obj if @deep_cloning
    @deep_cloning_obj = clone
    @deep_cloning_obj.instance_variables.each do |var|
      val = @deep_cloning_obj.instance_variable_get(var)
      begin
        @deep_cloning = true
        val = val.deep_clone
      rescue TypeError
        next
      ensure
        @deep_cloning = false
      end
      @deep_cloning_obj.instance_variable_set(var, val)
    end
    deep_cloning_obj = @deep_cloning_obj
    @deep_cloning_obj = nil
    deep_cloning_obj
  end
end

## 0  "Kentucky"         \
## 1  "West Virginia"    /  \
## 2  "Notre Dame"       \  /  \
## 3  "Wichita State"    /      \
## 4  "Wisconsin"        \      /  \
## 5  "UNC"              /  \  /    \
## 6  "Xavier"           \  /        \
## 7  "Arizona"          /            \
## 8  "NC State"         \            /
## 9  "Louisville"       /  \        /
## 10 "Oklahoma"         \  /  \    /
## 11 "Michigan State"   /      \  /
## 12 "Duke"             \      /
## 13 "Utah"             /  \  /
## 14 "UCLA"             \  /
## 15 "Gonzaga"          /