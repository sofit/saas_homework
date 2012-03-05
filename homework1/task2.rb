class WrongNumberOfPlayersError < StandardError ; end

class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  stategies = ['S', 'R', 'P']

  raise NoSuchStrategyError unless stategies.include?(game[0][1].upcase)
  raise NoSuchStrategyError unless stategies.include?(game[1][1].upcase)

  case [game[0][1].upcase, game[1][1].upcase]
  when ['R', 'S'], ['S', 'P'], ['P', 'R'], ['R', 'R'], ['P', 'P'], ['S', 'S']
    game[0]
  else
  game[1]
  end
end

def rps_tournament_winner(game)
  begin
    raise NoSuchStrategyError unless !game[0][1].kind_of?(Array)
    raise NoSuchStrategyError unless !game[0][1].kind_of?(Array)

    rps_game_winner(game)
  rescue NoSuchStrategyError => ex
    rps_tournament_winner([rps_tournament_winner(game[0]), rps_tournament_winner(game[1])])
  end
end