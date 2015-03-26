module BracketCruncher
  def self.calculate_combinations
    ncca_bracket = Bracket.find_by_is_template(true)

    alive_teams = Team.all :conditions => {:where => 'is_alive'}
  end
end