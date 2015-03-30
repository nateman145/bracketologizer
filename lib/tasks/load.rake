#require 'lib/rake_extensions'
namespace :load do

  task :brackets, [:filepath] => :environment do
    filepath ||= "files/bracketinput.csv"
    f = File.open(filepath, "r")
    f.each_line do |line|
      parts = line.split(",")
      bracket_name = parts.slice!(0).strip
      template = bracket_name == 'Official NCAA Bracket'
      user = User.find_by_display_name(bracket_name) || User.create!(:display_name => bracket_name)
      bracket = Bracket.find_by_bracket_name(bracket_name) || Bracket.create!(:bracket_name => bracket_name,
                                                                              :user => user,
                                                                              :is_template => template)
      unless bracket.bracket_node.nil?
        puts "Already generated bracket for #{bracket.bracket_name}"
        next
      end

      puts "Generating brackets for #{bracket_name}"
      round_of = 0
      depth = 0
      if parts.size > 64
        round_of = 64
      elsif parts.size < 64
        round_of = 32
        depth = 1
      end
      puts "Estimating round of #{round_of} bracket"

      count = 0
      previous_brackets = []
      current_brackets = []
      parts.each do |team_name|
        team_name.strip!
        count += 1
        if count > round_of
          puts "Round of #{round_of} entries: #{current_brackets.map{|e| e.team.team_name}}"
          raise "Too many entries!" if round_of == 1
          count = 1
          depth += 1
          round_of = round_of / 2
          previous_brackets = current_brackets
          current_brackets = []
        end

        team = Team.find_by_team_name(team_name) || Team.create!(:team_name => team_name)
        bn = BracketNode.create! :team => team, :depth => depth
        current_brackets << bn
        unless previous_brackets.blank?
          entries = previous_brackets.slice!(0..1)
          raise "Inproperly Formatted Bracket #{entries.map{|e| e.team.team_name}} doesn't include #{team.team_name}" if !team_name.blank? and !entries.map {|e| e.team.team_name}.include?(team.team_name)

          entries.each do |b|
            b.parent_node = bn
            b.save!
          end
        end
      end
      raise "We have more than one root node?!?!" if current_brackets.length > 1
      puts "Winner! #{current_brackets.first.team.team_name}"
      bracket.bracket_node = current_brackets.first
      bracket.save!
    end
  end

  task :teams, [:filepath] => :environment do
    filepath ||= "files/bracket_teams.xlsx"
    raise "Needs to be implemented! In the meantime, use load:brackets"
  end
end
